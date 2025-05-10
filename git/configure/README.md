# GitHub Action - Configure Git

The `git/configure` action provides the following functionality for GitHub Actions runner

- Set username in the git configuration
- Set useremail in the git configuration

## Usage

- `user_name`: The username to be set in the git configuration. Default value: `github-actions[bot]`

- `user_email`: The useremail to be set in the git configuration. Default value: `41898282+github-actions[bot]@users.noreply.github.com`

```yaml
steps:
  uses: iumangg/actions/git/configure@main
  with:
    user_name: "Test User"
    user_email: "test@example.com"
```
