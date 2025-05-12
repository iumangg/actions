# GitHub Action - Repository Size

The `repo-size` action provides the following functionality for GitHub Actions runner

- Calculate the size of the root diretory of the repository
- Calculate the size of child directories upto 2 levels down
- The results are store in a YAML file

## Usage

- `repo_size_file`: Path to the file where result of repo sizes will stored. Default value: `.github/repo-size.yaml`

```yaml
steps:
  uses: iumangg/actions/repo-size@main
  with:
    repo_size_file: folder/custom-repo-size.yaml
```

## Example output file

Below is the example yaml output from the repo-size action running on this repository

```yaml
root: 512 KB
  .git: 404 KB
    hooks: 64 KB
    info: 8.0 KB
    logs: 48 KB
    objects: 212 KB
    refs: 40 KB
  .github: 20 KB
    workflows: 12 KB
  gh: 20 KB
    pr-create: 8.0 KB
    pr-merge: 8.0 KB
  git: 44 KB
    checkout-branch: 12 KB
    commit: 8.0 KB
    configure: 12 KB
    push: 8.0 KB
  repo-size: 12 KB
```
