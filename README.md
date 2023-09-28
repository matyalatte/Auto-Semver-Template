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

## `version.txt`

`version.txt` has the version info.  
The first line is the semver.  
The second line is the latest commit date.  
And the third line is the commit hash.  

## How to update `version.txt`

You can use `update_version.sh` to update `version.txt`.  

- `bash update_version.sh` updates the commit info but won't increment the semver.  
- `bash update_version.sh patch` increments the patch version.  
- `bash update_version.sh minor` increments the minor version.  
- `bash update_version.sh major` increments the major version.  

## How to run `update_version.sh` with PR

When a PR is merged, the workflow runs `update_version.sh` to update the commit info, and pushes the changes to the main branch.  

You can also use labels to update semver.  
- When the merged PR is labeled with `patch`, the workflow increments the patch version with `bash update_version.sh patch`.  
- When the label is `minor`, the workflow increments the minor version.  
- When the label is `major`, the workflow increments the major version.  

## How to create tags and release drafts

When the merged PR is labeled with `patch`, `minor`, or `major`, the workflow creates a tag and a release draft.  

## How to add version info to API documents

You can write the API documents with `@next_version@` like this.

```
/**
 * Adds two integers.
 *
 * @param a an integer.
 * @param b an integer.
 * @returns a + b
 * @since @next_version@
 */
int add(int a, int b);
```

When updating the semver, `update_version.sh` replaces all `@next_version@` in `api.h` with the updated version.  

```
/**
 * Adds two integers.
 *
 * @param a an integer.
 * @param b an integer.
 * @returns a + b
 * @since 1.0.1
 */
int add(int a, int b);
```
