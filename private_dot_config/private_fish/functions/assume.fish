function check_profile
    if test (count $argv) -eq 0
        printf "Usage: assume profile\nMissing profile argument"
        return 1
    end
end

function get_token_code
    ykman oath accounts code $AWS_MFA_ARN | awk '{print $2}'
end

function assume
    check_profile $argv; or return 1

    set -l TOKEN_CODE (get_token_code)
    
    # Get a session token using the MFA token
    set -l SESSION_TOKEN (aws sts get-session-token --serial-number $AWS_MFA_ARN --token-code $TOKEN_CODE --profile $AWS_MFA_PROFILE --output json)
    if test $status -ne 0
        echo "Failed to get session token"
        return 1
    end
    set -gx AWS_ACCESS_KEY_ID (echo $SESSION_TOKEN | jq -r '.Credentials.AccessKeyId')
    set -gx AWS_SECRET_ACCESS_KEY (echo $SESSION_TOKEN | jq -r '.Credentials.SecretAccessKey')
    set -gx AWS_SESSION_TOKEN (echo $SESSION_TOKEN | jq -r '.Credentials.SessionToken')

    # Use the temporary credentials to assume the role
    set -l ROLE_ARN (aws configure get role_arn --profile $argv[1])
    if test -z "$ROLE_ARN"
        echo "No role_arn found for profile $argv[1]"
        return 1
    end

    set -l SOURCE_PROFILE (aws configure get source_profile --profile $argv[1])
    if test -z "$SOURCE_PROFILE"
        echo "No source_profile found for profile $argv[1]"
        return 1
    end

    set -l MFA_SERIAL (aws configure get mfa_serial --profile $SOURCE_PROFILE)
    if test -z "$MFA_SERIAL"
        echo "No mfa_serial found for profile $SOURCE_PROFILE"
        return 1
    end

    set -l ASSUMED_ROLE (aws sts assume-role --role-arn $ROLE_ARN --role-session-name $(whoami) --output json)
    if test $status -ne 0
        echo "Failed to assume role"
        return 1
    end

    # unset the previously used environment variables
    set -e -g AWS_ACCESS_KEY_ID
    set -e -g AWS_SECRET_ACCESS_KEY
    set -e -g AWS_SESSION_TOKEN

    # Set the environment variables with the assumed role credentials
    set -Ux AWS_ACCESS_KEY_ID (echo $ASSUMED_ROLE | jq -r '.Credentials.AccessKeyId')
    set -Ux AWS_SECRET_ACCESS_KEY (echo $ASSUMED_ROLE | jq -r '.Credentials.SecretAccessKey')
    set -Ux AWS_SESSION_TOKEN (echo $ASSUMED_ROLE | jq -r '.Credentials.SessionToken')
    echo "Successfully assumed role for profile $argv[1]"
end
