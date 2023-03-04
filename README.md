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

### Publish new chart version
Change the version in `Chart.yaml`. When the change is merged to main, it will trigger creating a release.

A version bump is not enforced, so changes are collected on branch `main` and only released when the version of 
the chart is changed.
