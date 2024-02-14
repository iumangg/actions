# Push to another Repository - Github Action
Action to push file/directory to another repository using Access Key (API Token)

## Usage
```yaml
uses: ./push-to-another-repo
with:
  source: test-dir
  destination_repo_name: galaumang/actions
  destination_branch: test-directory
  access_key: ${{ secrets.ACCESS_KEY }}
```
