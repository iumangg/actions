echo "Review state: $review_state"
if [[ $review_state == "approved" ]]; then
  gh pr merge $pr_number --repo $repository --merge --subject "$merge_commit_message"
  echo "Pull request #$pr_number merged successfully."
else
  echo "Review not approved. Skipping merge."
fi
