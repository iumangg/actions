# Commit Changes
git add "$file_path"
echo "Changes added successfully to git - $file_path"
if git diff --quiet && git diff --staged --quiet; then
  echo "commit_executed=false" >> $GITHUB_OUTPUT
  echo "Skipping commit as there are no changes to commit."
else
  git commit -m "$commit_message"
  echo "commit_executed=true" >> $GITHUB_OUTPUT
  echo "Changes committed successfully."
fi