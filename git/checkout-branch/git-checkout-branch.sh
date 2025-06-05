# Check if the branch name is empty string
if [ -z "$branch_name" ]; then
  echo "Branch name is provided empty string. Using default branch 'main'."
  branch_name="main"
fi
# Checkout the specified branch
git checkout -B "$branch_name"