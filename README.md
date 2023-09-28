# Auto-Semver-Template
Scripts to update semantic version with github actions

## Setup

You need to give write permissions to workflows.  

1.  Move to `Settings -> Actions -> General -> Workflow permissions`
2.  Check `Read and write permissions`
3.  Click `Save`

You also need to create three labels (`patch`, `minor`, and `major`) for PRs.  

1.  Move to `Issues -> Labels`
2.  Click `New label`
3.  Set `patch` as the label name
4.  Click `Create label`
5.  Create `minor` and `major` in the same way.
