## Helm chart for Athens Go Proxy
* [gomods/athens](https://github.com/gomods/athens)
* requires helm v3

```shell script
helm repo add athens https://gomods.github.io/athens-charts
helm search repo athens
```

On Artifact Hub: https://artifacthub.io/packages/search?org=gomods

## Contribute
* Create issues, create PRs, ... let's make this better together.
* See [Contributing](CONTRIBUTING.md)

### Publish a new chart version
Create a PR that changes the version in `Chart.yaml`. When the change is merged to main, it will trigger creating a release.

A version bump is not enforced, so changes are collected on branch `main` and only released when the version of 
the chart is changed.

To release the chart with a new Athens version, the PR that bumps the Athens image version is created automatically.
This can be merged to `main` without impact for the current release. After this, create a PR that updates the Chart
version to release the chart using the new Athens image version.
