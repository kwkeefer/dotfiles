function main_branch
    git remote show origin | awk -F ':' '/HEAD branch/ {print $NF}'
end

