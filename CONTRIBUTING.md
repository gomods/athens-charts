# Contributing to Athens Helm Chart
Hurray! We are glad that you want to contribute to our project! 👍

If this is your first contribution, not to worry! We have a great [tutorial](https://www.youtube.com/watch?v=bgSDcTyysRc) 
to help you get started, and you can always ask us for help in the `#athens` channel in the 
[gopher slack](https://invite.slack.golangbridge.org/). We'll give you whatever guidance you need. Another great 
resource for first time contributors can be found 
[here](https://github.com/firstcontributions/first-contributions/blob/master/README.md).

## Claiming an issue
If you see an issue that you'd like to work on, please just post a comment saying that you want to work on it. 
Something like "I want to work on this" is fine.

## Creating a Fork for a Pull Request
Explained at 12:29 in the above [tutorial video](https://youtu.be/bgSDcTyysRc?t=749).

## Verify your work
After you made your changes, here's how you can run tests
- With forking the repo, you also have all the GitHub Actions running. Check if all actions pass on your branch after 
you pushed your changes.
- If you introduced new configuration to `values.yaml`, consider adding it in `charts/athens-proxy/ci` which 
gets used during `ct install` to verify the installation on a `kind` cluster in the pipeline.
- If you introduced new templates or helpers, make sure to verify that they produce valid yaml and manifests. You can 
run [Chart Testing](https://github.com/helm/chart-testing) to lint the Chart using the `charts/athens-proxy/ci` examples:
`ct lint --check-version-increment=false --all` 

## Test your own Chart version
With a fork and a branch off of `main`, you can also test merging and producing your own release for testing.
1. Make sure your fork repo has a branch `gh_pages` and setup GitHub Pages for it.
2. Create a PR **in your repo** to merge your branch to your main branch.
3. Merge your PR and if all actions pass, GitHub Actions will create a release **in your repo**, including updating the
GitHub Pages (which you can point Helm to).

**Important**: If you do this, you need to later revert your `main` branch either through force-pushing the original 
state or by deleting your fork (after your contributions have been merged) and creating a new one. 

## Next Steps

After you get your code working, submit a Pull Request (PR) following 
[Github's PR model](https://help.github.com/articles/about-pull-requests/).

If you're interested, take a look at [athens/REVIEWS.md](https://github.com/gomods/athens/blob/main/REVIEWS.md) to learn how
your PR will be reviewed and how you can help get it merged.