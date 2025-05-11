# GitHub Action - Git Checkout branch

The `git/checkout-branch` action provides the following functionality for GitHub Actions runner

- Checkout and switch to the branch

## Usage

- `branch_name`: The branch name to be checkout and switch to. Default value: `main`

```yaml
steps:
  uses: iumangg/actions/git/checkout-branch@main
  with:
    branch_name: "test-branch"
```
