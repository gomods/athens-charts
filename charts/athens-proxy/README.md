# Athens Proxy Helm Chart: athens-proxy

![Version: 0.12.2](https://img.shields.io/badge/Version-0.12.2-informational?style=flat-square) ![AppVersion: v0.14.1](https://img.shields.io/badge/AppVersion-v0.14.1-informational?style=flat-square)

## What is Athens?

[Athens](https://docs.gomods.io) is a repository for packages used by your go packages.

Athens provides a repository for [Go Modules](https://github.com/golang/go/wiki/Modules) that you can run. It serves public code and your private code for you, so you don't have to pull directly from a version control system (VCS) like GitHub or GitLab.

## Prerequisites

Kubernetes: `>= 1.10`

## Requirements

- A running Kubernetes cluster
- [Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) installed and setup to use the cluster
- [Helm](https://helm.sh/) [installed](https://github.com/helm/helm#install) and setup to use the cluster (helm init) or [Tillerless Helm](https://github.com/rimusz/helm-tiller)

## Deploy Athens

The fastest way to install Athens using Helm is to deploy it from our public Helm chart repository. First, add the repository with this command:

```console
$ helm repo add athens https://gomods.github.io/athens-charts
$ helm repo update
```

Next, install the chart with default values to `athens` namespace: 

```
$ helm install athens/athens-proxy -n athens --namespace athens
```

This will deploy a single Athens instance in the `athens` namespace with `disk` storage enabled. Additionally, a `ClusterIP` service will be created.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | see https://kubernetes.io/docs/reference/kubernetes-api/workload-resources/pod-v1/#scheduling |
| annotations | object | `{}` |  |
| autoscaling.apiVersionOverride | string | `""` |  |
| autoscaling.behavior | object | `{}` |  |
| autoscaling.enabled | bool | `false` | Enable Horizontal Pod Autoscaling |
| autoscaling.maxReplicas | int | `3` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| autoscaling.targetMemoryUtilizationPercentage | int | `80` |  |
| basicAuth.enabled | bool | `false` |  |
| basicAuth.passwordSecretKey | string | `"password"` |  |
| basicAuth.secretName | string | `"athens-proxy-basic-auth"` |  |
| basicAuth.usernameSecretKey | string | `"username"` |  |
| configEnvVars | object | `{}` | Extra environment variables to be passed You can add any new ones at the bottom |
| extraLabels | object | `{}` |  |
| gitconfig.enabled | bool | `false` |  |
| gitconfig.secretKey | string | `"gitconfig"` |  |
| gitconfig.secretName | string | `"athens-proxy-gitconfig"` |  |
| goGetWorkers | int | `3` |  |
| image.pullPolicy | string | `"IfNotPresent"` | Specify a imagePullPolicy ref: http://kubernetes.io/docs/user-guide/images/#pre-pulling-images |
| image.pullSecrets | list | `[]` | Specify secrets containing credentials for pulling images |
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"gomods/athens"` |  |
| image.runAsNonRoot | bool | `false` | Determines if the image should run as `root` or user `athens` |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts | list | `[]` | Provide an array of values for the ingress host mapping |
| ingress.tls | list | `[]` |  |
| initContainerSecurityContext | object | `{}` | Init container security context configuration |
| intiContainerResources | object | `{}` |  |
| jaeger.annotations | object | `{}` |  |
| jaeger.enabled | bool | `false` |  |
| jaeger.image.repository | string | `"jaegertracing/all-in-one"` |  |
| jaeger.image.tag | string | `"latest"` |  |
| jaeger.type | string | `"ClusterIP"` |  |
| jaeger.url | string | `""` |  |
| livenessProbe.failureThreshold | int | `3` |  |
| livenessProbe.periodSeconds | int | `10` |  |
| livenessProbe.successThreshold | int | `1` |  |
| livenessProbe.timeoutSeconds | int | `1` |  |
| metrics.serviceMonitor.enabled | bool | `false` |  |
| metrics.serviceScrape.enabled | bool | `false` |  |
| netrc.enabled | bool | `false` |  |
| netrc.existingSecret | string | `"netrcsecret"` |  |
| nodeSelector | object | `{}` | see https://kubernetes.io/docs/reference/kubernetes-api/workload-resources/pod-v1/#scheduling |
| priorityClassName | string | `""` | Priority class for pod scheduling (see API reference: https://kubernetes.io/docs/concepts/configuration/pod-priority-preemption/#priorityclass) |
| replicaCount | int | `1` | Sets the number of athens-proxy replicas, unless autoscaling is enabled |
| resources | object | `{}` | see https://kubernetes.io/docs/reference/kubernetes-api/workload-resources/pod-v1/#resources |
| securityContext | object | `{}` | Container security context configuration (see API reference: https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.28/#securitycontext-v1-core) This will override the `image.runAsNonRoot` settings in the specified container if `runAsUser` or `runAsGroup` are set |
| service.annotations | object | `{}` | Additional annotations to apply to the service |
| service.nodePort.port | int | `30080` | Available port in allowable range (e.g. 30000 - 32767 on minikube) |
| service.servicePort | int | `80` | Port as exposed by the service |
| service.type | string | `"ClusterIP"` | Type of service; valid values are "ClusterIP", "LoadBalancer", and "NodePort". "ClusterIP" is sufficient in the case when the Proxy will be used from within the cluster. To expose externally, consider a "NodePort" or "LoadBalancer" service. |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| sshGitServers | list | `[]` |  |
| storage.disk.persistence.accessMode | string | `"ReadWriteOnce"` |  |
| storage.disk.persistence.enabled | bool | `false` | Note if you use disk.persistence.enabled, replicaCount should be set to 1 unless your access mode is ReadWriteMany and strategy type must be Recreate |
| storage.disk.persistence.size | string | `"4Gi"` |  |
| storage.disk.storageRoot | string | `"/var/lib/athens"` |  |
| storage.gcp.bucket | string | `""` |  |
| storage.gcp.projectID | string | `""` |  |
| storage.gcp.serviceAccount | string | `""` |  |
| storage.minio.accessKey | string | `""` |  |
| storage.minio.bucket | string | `""` |  |
| storage.minio.endpoint | string | `""` |  |
| storage.minio.secretKey | string | `""` |  |
| storage.mongo.url | string | `""` |  |
| storage.s3.accessKey | string | `""` |  |
| storage.s3.bucket | string | `""` |  |
| storage.s3.forcePathStyle | bool | `false` |  |
| storage.s3.region | string | `""` |  |
| storage.s3.secretKey | string | `""` |  |
| storage.s3.sessionToken | string | `""` |  |
| storage.s3.useDefaultConfiguration | bool | `false` |  |
| storage.type | string | `"disk"` | Storage type to use. For a single instance a PVC may be sufficient |
| strategy.rollingUpdate.maxSurge | int | `1` |  |
| strategy.rollingUpdate.maxUnavailable | int | `1` |  |
| strategy.type | string | `"Recreate"` | Using RollingUpdate requires a shared storage |
| tolerations | list | `[]` | see https://kubernetes.io/docs/reference/kubernetes-api/workload-resources/pod-v1/#scheduling |
| upstreamProxy.enabled | bool | `false` |  |
| upstreamProxy.url | string | `"https://gocenter.io"` |  |

## Advanced Configuration

For more advanced configuration options please check Athens [docs](https://docs.gomods.io/install/install-on-kubernetes/#advanced-configuration).

Available options:
- [Replicas](https://docs.gomods.io/install/install-on-kubernetes/#replicas)
- [Access to private repositories via Github](https://docs.gomods.io/install/install-on-kubernetes/#give-athens-access-to-private-repositories-via-github-token-optional)
- [Storage Providers](https://docs.gomods.io/install/install-on-kubernetes/#storage-providers)
- [Kubernetes Service](https://docs.gomods.io/install/install-on-kubernetes/#kubernetes-service)
- [Ingress Resource](https://docs.gomods.io/install/install-on-kubernetes/#ingress-resource)
- [Upstream module repository](https://docs.gomods.io/install/install-on-kubernetes/#upstream-module-repository)
- [.netrc file support](https://docs.gomods.io/install/install-on-kubernetes/#netrc-file-support)
- [gitconfig support](https://docs.gomods.io/install/install-on-kubernetes/#gitconfig-support)

### Pass extra configuration environment variables

You can pass any extra environment variables supported in [config.dev.toml](../../../config.dev.toml).
The example below shows how to set username/password for basic auth:

```yaml
configEnvVars:
  - name: BASIC_AUTH_USER
    value: "some_user"
  - name: BASIC_AUTH_PASS
    value: "some_password"
```

### Private git servers over ssh support

One or more of git servers can added to `sshGitServers`, and the corresponding config files (git config and ssh config) and ssh keys will be created. Athens then will use these configs and keys to download the source from the git servers.

```yaml
sshGitServers:
  ## Private git servers over ssh
  ## to enable uncomment lines with single hash below
  ## hostname of the git server
  - host: git.example.com
    ## ssh username
    user: git
    ## ssh private key for the user
    privateKey: |
      -----BEGIN RSA PRIVATE KEY-----
      ...
      -----END RSA PRIVATE KEY-----
    ## ssh port
    port: 22
```

## Testing

Using `chart-testing` to lint, install and test the chart on a local Kubernetes (Minikube, Rancher Desktop, ...)

```shell
ct lint-and-install --all
```
