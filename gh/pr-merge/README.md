# GitHub Action - GitHub Pull Request Merge

The `gh/pr-merge` action provides the following functionality for GitHub Actions runner

- Merge the GitHub Pull Request is the review is approved

## Usage

- `GH_TOKEN`: The GitHub personal access token used for authentication to perform PR merge operation. This is passed as env parameter to the action.
- `repository`: The repository to merge the pull request in. Default value: `${{ github.repository }}`
- `pr_number`: The pull request number to merge. Default value: `${{ github.event.pull_request.number }}`
- `review_state`: The review state to check for approval. Default value: `${{ github.event.review.state }}`
- `merge_commit_message`: The commit message for the merge commit. Default value: `pr: merge pull request #${{ github.event.pull_request.number }} from ${{ github.actor }}/${{ github.event.pull_request.head.ref }}`

```yaml
steps:
  uses: iumangg/actions/gh/pr-merge@main
  env:
    GH_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```
