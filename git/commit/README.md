# GitHub Action - Git Checkout branch

The `git/commit` action provides the following functionality for GitHub Actions runner

- Commit changes to repository
- Custom commit message using parameter
- Commit only specific files or folder

## Usage

- `commit_message`: The commit message for the changes to be commited. Default value: `${{ github.job }} job pushed changes`

- `file_path`: Specific path to files or folder to be commited. Default value: `.`

```yaml
steps:
  uses: iumangg/actions/git/commit@main
  with:
    commit_message: "My custom commit message"
    file_path: "path/to/commit"
```
