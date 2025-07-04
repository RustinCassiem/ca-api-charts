# Layer7 API Developer Portal
The Layer7 API Developer Portal (API Portal) is part of the Layer7 API Management solution, which consists of API Portal and API Gateway.

## Introduction
This Chart deploys the Layer7 API Developer Portal on a Kubernetes Cluster using the Helm Package Manager.

## Release Notes

## 2.3.16 General Updates
- This new version of the chart supports API Portal 5.3.3
- Upgrade to 2.3.16 is only supported from 2.3.10 chart version as per the Portal version.
- Updated the Openshift installation procedure through an example. Refer examples/portal folder.

## 2.3.15 General Updates
- Adding pod annotations to all the jobs in portal.
- Upgrade to 2.3.15 is only supported from 2.3.9 chart version as per the Portal version.

## 2.3.14 General Updates
- Adding pod annotations to all the deployments and stateful sets in portal.
- Druid level forceRedploy flag is removed and replaced at deployment and stateful set level.
- Upgrade to 2.3.14 is only supported from 2.3.9 chart version as per the Portal version.

## 2.3.13 General Updates
- Ingress-NGINX Subchart is upgraded to version 4.12.1 to fix [Vulnerability](https://github.com/kubernetes/kubernetes/issues/131007).
- Upgrade to 2.3.13 is only supported from 2.3.9 chart version as per the Portal version.
## 2.3.12 General Updates
- This new version of the chart supports API Portal 5.3.2
- Upgrade to 2.3.12 is only supported from 2.3.9 chart version as per the Portal version.
- Ingress-NGINX Subchart is upgraded to version 4.12.0 to support K8s 1.29 version.
- DB container(for testing) upgraded to support 8.4.4 MySQL version.
## 2.3.11 General Updates
- Added a preflight check (initContainer) for the core apim/ingress deployment
  - This resolves a race condition that occurs on slower hardware where apim/ingress starts before other dependent services are ready. 
  - This is ***enabled by default***.
    - This only gets added when you install the Chart.
      - A Helm upgrade will ***NOT*** restart the apim deployment if you have already installed the Chart and are upgrading to this version.
      - A Helm upgrade will restart the apim deployment if you installed from this version and upgrade the Chart.
    - If you wish to disable this, set apim.preflightCheck.enabled to false
    ```
    apim:
      ...
      preflightCheck:
        enabled: true
      ...
    ```

## 2.3.10 General Updates
- This new version of the chart supports API Portal 5.3.1
- Removed PSSG container
- Upgrade to 2.3.10 is only supported from 2.3.8 chart version as per the Portal version.
## 2.3.9 General Updates
- This new version of the chart supports API Portal 5.3
- Upgrade to 2.3.9 is only supported from 2.3.4 chart version as per the Portal version.
- Ingress-NGINX Subchart is upgraded to version 4.10.0 to support K8s 1.29 version.
- DB container(for testing) upgraded to support 8.0.37 MySQL version.
- If the RMQ container fails to start, scale-down the RMQ statefulset, delete the RMQ volume and try again.
- Refer release notes for more info https://techdocs.broadcom.com/us/en/ca-enterprise-software/layer7-api-management/api-developer-portal/5-3/release-notes-api-developer-portal.html
## 2.3.8 General Updates
- This new version of the chart supports API Portal 5.2.3
## 2.3.7 General Updates
- This new version of the chart supports API Portal 5.2.2.1
## 2.3.6 General Updates
- Updated ci values
  - no impact
## 2.3.4 General Updates
- This new version of the chart supports API Portal 5.2.2
- Ingress-NGINX Subchart is upgraded to version 4.7.2 to support K8s 1.26+ version.
- Rabbitmq chart is upgraded to 12.0.3. Updated additional documentation w.r.t rabbitmq persistence.[Refer rabbitmq.volumePermissions.enabled](https://github.com/CAAPIM/apim-charts/blob/develop/portal/charts/portal/README.md#global-parameters)
- Introduced global.useExistingDatabaseSecret to avoid specifying the external MySQL password. [Refer for global.useExistingDatabaseSecret](https://github.com/CAAPIM/apim-charts/blob/develop/portal/charts/portal/README.md#global-parameters).
## 2.3.3 General Updates
- This new version of the chart supports API Portal 5.2.1.
## 2.3.2 General Updates
- Ingress-NGINX Subchart is upgraded to version 4.5.2 to support K8s 1.25+ version.
- Ingress-NGINX Subchart deployment is disabled by default in values-production.yaml. Use any Ingress-controller that supports SSL/TLS Passthrough.
## 2.3.1 General Updates
- This new version of the chart supports API Portal 5.2.0.1, which has authenticator's high cpu usage fixed.
## 2.3.0 General Updates
- This new version of the chart supports API Portal 5.2.
## 2.2.10 General Updates
- This new version of the chart supports API Portal 5.1.2.1, refer release notes for more info https://techdocs.broadcom.com/us/en/ca-enterprise-software/layer7-api-management/api-developer-portal/5-1-2/release-notes-api-developer-portal.html

## 2.2.9 General Updates
- This version fixes the broken functional issue of enrolling proxy so the advisory to use this version after 2.2.5

## 2.2.8 General Updates
- Updating the portal version doc link.

## 2.3.0 General Updates
- This new version of the chart supports API Portal 5.2.

## 2.2.7 General Updates
- This new version of the chart supports API Portal 5.1.2.
- Faclilates to parametrize imagePullPolicy for all three portal jobs: db-upgrade-portal, db-upgrade-rbac and cert-upgrade.
## 2.2.6 General Updates
- Fixing bitnami repository dependency issue.

## 2.2.5 General Updates
- This new version of the chart supports API Portal 5.1.1 to support internal SaaS only release


## 2.2.4 General Updates
- Removed pssg related environment variables from portal-enterprise and portal-data containers.

## 2.2.2 General Updates
- The minimum and maximum memory limit of PSSG was increased as the underlying service is a Gateway that was upgraded to version 10.1 CR1.

## 2.2.0 General Updates
- This new version of the chart supports API Portal 5.1.
- NGINX-Ingress Subchart is upgraded to version 4.0.9 to support K8s 1.22+ version.
  - Subchart version 4+ is required for kubernetes 1.22+ due to change in Ingress class API.
  - Depending on the platform and the Ingress setup in your environment, configure 'ingress.class.name' and 'ingress-nginx.ingressClassResource' in values.yaml accordingly, by following Ingress-nginx's [community documentation](https://kubernetes.github.io/ingress-nginx/#getting-started).
  - If you are not using the subchart use 'kubernetes.io/ingress.class' annotation to support backward compatibility.
  - [Learn more about configuring multiple ingress controllers in one cluster.](https://kubernetes.github.io/ingress-nginx/user-guide/multiple-ingress)
- The Demo database that is based on Bitnami MySQL subchart version is updated to 9.4.7.
- Upgrade jobs are moved to pre-install and pre-upgrade stage. This eliminates manual deletion of jobs in future upgrades after API Portal 5.1.The overall bootup time remains the same as previous version upgrades, even though you may observe that the helm install takes additional time to show completion.
- API Portal 5.1 no longer requires Solr component that is used to provide auto-suggest search history from the Portal dashboard. All the references to Solr are  removed.
- You can now configure existing imagePullSecrets or external registries to pull the images. Refer portal.useExistingPullSecret, portal.imagePullSecret in values.yaml
- You can configure liveness and readiness probe of dispatcher component.
- Added troubleshooting section related to [RabbitMQ boot-up issues.](#rabbitmq-wont-start)
- Updated documentation for persistent volumes and 'tls.job.enabled' and tls.job.rotate' properties regarding certificates.

## Prerequisites

- Kubernetes 1.22.x
- Helm v3.7.x
- Persistent Volume Provisioner (if using PVC for RabbitMQ/Analytics)
- An Ingress Controller that supports SSL Passthrough (i.e. Nginx)
- ***docker secret.yaml*** available on the [CA API Developer Portal
Solutions & Patches](https://techdocs.broadcom.com/us/product-content/recommended-reading/technical-document-index/ca-api-developer-portal-solutions-and-patches.html) page.

### Production
- A dedicated MySQL 8.0.31/8.0.33/8.0.34/8.0.37/8.0.39/8.4.4 server [See TechDocs for more information](https://techdocs.broadcom.com/us/en/ca-enterprise-software/layer7-api-management/api-developer-portal/5-3/install-configure-and-upgrade/install-portal-on-docker-swarm/configure-an-external-database.html)
- 3 Worker nodes with at least 4vcpu and 32GB ram - High Availability with analytics
- Access to a DNS Server
- Signed SSL Server Certificate

# Install the Chart
When using this chart in Production, save value-production.yaml as ***<my-values.yaml>*** and use this as your starting point.
Adding ```-f <my-values.yaml>``` to the following commands below will apply your configuration to the chart. For details on what you can change, see [configuration](#configuration).

```
 $ helm repo add layer7 https://caapim.github.io/apim-charts/
 $ helm repo update
 $ helm install <release-name> --set-file "portal.registryCredentials=/path/to/docker-secret.yaml" layer7/portal
```

> :information_source: **Important** <br>
> **Credentials for RabbitMQ** are generated when this chart is installed. To prevent loss after test/development use or accidental deletion,
retrieve and store them in values.yaml for subsequent releases. You can also turn off persistent storage for RabbitMQ and/or manually remove the volumes following deletion or uninstall of the chart.

```
rabbitmq.auth.erlangCookie
$ kubectl get secret rabbitmq-secret -o 'go-template={{index .data "rabbitmq-erlang-cookie" | base64decode }}' -n <release-namespace>

rabbitmq.auth.password
$ kubectl get secret rabbitmq-secret -o 'go-template={{index .data "rabbitmq-password" | base64decode }}' -n <release-namespace>
```

## Upgrade the Chart

To upgrade API Portal deployment, run the following commands:
```
 $ helm repo update
 $ helm upgrade <release-name> --set-file "portal.registryCredentials=/path/to/docker-secret.yaml" layer7/portal
```
## Delete the Chart
To delete API Portal installation, run the following command:

```
 $ helm delete <release name>
```

*Manually clean up additional resources such as PVCs and Secrets. This protects your data if deleted accidentally.*

## Upgrade External Portal Database to MySQL 8.0
MySQL 8.0 is supported as an external database starting from API Portal 5.0 CR-1. This section helps you understand the overall process of upgrading an existing Portal database running MySQL 5.7 to MySQL 8.0.

1) Before upgrading the Database, see **Before You Begin** and **Check Database Compatibility** in [TechDocs.](https://techdocs.broadcom.com/us/en/ca-enterprise-software/layer7-api-management/api-developer-portal/5-2/install-configure-and-upgrade/install-portal-on-docker-swarm/upgrade-portal-database-to-mysql-8.html)


2) Persist Analytics Data into Druid Database
```
 Connect the coordinator pod(s) and run below com
 $ kubectl exec -it coordinator-0|1 -n <namespace> sh

 Run the following curl command to persists Analytics data
 $ curl --location --request POST 'localhost:8081/druid/indexer/v1/supervisor/terminateAll'

 Run the below curl commands and wait until the runningTasks response is empty and the supervisor response is empty before proceeding with other steps.
 $ curl localhost:8081/druid/indexer/v1/runningTasks
 $ curl localhost:8081/druid/indexer/v1/supervisor
```

3) Stop the running portal
```
 Get the Release name
 $ helm list -n <namespace>

 Uninstall the chart
 $ helm uninstall <release name> -n <namespace>
```

4) Upgrade MySQL 5.7 to 8.0.26. For more information, see **Perform the Upgrade** [TechDocs](https://techdocs.broadcom.com/us/en/ca-enterprise-software/layer7-api-management/api-developer-portal/5-2/install-configure-and-upgrade/install-portal-on-docker-swarm/upgrade-portal-database-to-mysql-8.html)

5) After MySQL is upgraded, ensure that you can connect to it and then follow the below steps to start the portal with MySQL 8.0.26.
Ensure that the value of **tls.job.enabled** is set to **false** in **values.yaml**
```
Install the chart again
 $ helm install <release name> -n <namespace>
```

## Additional Guides/Info
* [Use/Replace Signed Certificates](#certificates)
* [DNS Configuration](#dns-configuration)
* [SMTP Settings](#smtp-parameters)
* [RBAC Parameters](#rbac-parameters)
* [FS Permissions](#fs-permissions)
* [Migrate from Docker Swarm/Previous Helm Chart](../../utils/portal-migration/README.md)
* [Upgrade this Chart](#upgrade-this-chart)
* [Cloud Deep Storage for Minio](#druid)
* [Create New Tenant](../../utils)
* [Persistent Volumes](#persistent-volumes)
* [Troubleshooting](#troubleshooting)
* [Portal TLS Defaults](#portal-tls-defaults)
* [Portal Cipher Suites Defaults](#portal-cipher-suites-defaults)
* [Portal Request XSS Filter](#portal-request-xss-filter)
* [Audit Event Logs](#audit-event-logs)


# Configuration
This section describes configurable parameters in **values.yaml**, there is also ***production-values.yaml*** that represents the minimum recommended configuration for deploying the Portal with analytics (if enabled) and core services in an HA, fault tolerant configuration.

### Global Parameters
| Parameter                                 | Description                                                                                                          | Default                                                      |
|-------------------------------------------|----------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------|
| `global.portalRepository` | Image Repository | `caapim/` |
| `global.pullSecret` | Image Pull Secret name | `broadcom-apim` |
| `global.setupDemoDatabase` | Deploys MySQL as part of this Chart | `false` |
| `global.databaseSecret` | Database secret name. If **global.setupDemoDatabase** is true, ensure **mysql.auth.existingSecret** uses the same secret that contain the keys `mysql-root-password`, `mysql-replication-password` along with `mysql-password` | `database-secret` |
| `global.useExistingDatabaseSecret` | Configures Portal Deployment to use **global.databaseSecret** for fetching the DB password | `false` |
| `global.databaseUsername` | Database username | `admin` |
| `global.demoDatabaseRootPassword` | Demo Database root password | `7layer`|
| `global.demoDatabaseReplicationPassword` | Demo Database replication password | `7layer`|
| `global.databasePassword` | Database password | `7layer` |
| `global.databaseHost` | Database Host | `` |
| `global.databasePort` | Database Port | `3306` |
| `global.databaseUseSSL` | Use SSL when communicating with the Database | `true` |
| `global.databaseRequireSSL` | Require Database support of SSL connection if databaseUseSSL=true | `false` |
| `global.legacyHostnames` | Legacy Hostnames | `false` |
| `global.legacyDatabaseNames` | Legacy Database names | `false` |
| `global.subdomainPrefix` | Subdomain Prefix | `dev-portal` |
| `global.helpPage` | Documentation Help Page | `https://techdocs.broadcom.com/us/en/ca-enterprise-software/layer7-api-management/api-developer-portal/` |
| `global.storageClass` | Global Storage Class | `_` |
| `global.schedulerName` | Global Scheduler name for Portal + Analytics, this doesn't apply to other subcharts | `not set` |
| `global.saas` | Reserved | `not set` |
| `global.additionalLabels` | A list of custom key: value labels applied to all components | `not set` |
| `global.podSecurityContext`    | [Pod Security Context](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod) settings are applied to all portal microservices.               | `[]` |
| `global.containerSecurityContext`    | [Container Security Context](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-container) settings are applied to all portal microservices.           | `{}` |


### Portal Parameters
| Parameter                                 | Description                                                                                                          | Default                                                      |
|-------------------------------------------|----------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------|
| `portal.domain` | The Portal Domain | `example.com` |
| `portal.enrollNotificationEmail` | Notification email address | `noreply@example.com` |
| `portal.analytics.enabled` | Enable/Disable the Druid Analytics stack. Ensure to apply the minio-secret manually if the flag is set to true during 'helm upgrade'. A sample **'minio-secret.yml'** is provided in apim-charts/utils, use **'kubectl apply -f ../../utils/minio-secret.yml -n \<namespace\>'** to create minio-secret  | `true` |
| `portal.analytics.aggregation` | Enable/Disable Aggregation, requires a min of 2 analytics.replicaCount | `false` |
| `portal.license.secretName` | License secret name | `portal-license` |
| `portal.license.value` | License value - ***Note: these are not required for Portal 5.x *** | `` |
| `portal.internalSSG.secretName` | APIM secret name | `ssg-secret` |
| `portal.internalSSG.username` | APIM username - auto-generated | `auto-generated` |
| `portal.internalSSG.password` | APIM password - auto-generated | `auto-generated` |
| `portal.papi.secretName` | PAPI secret name | `papi-secret` |
| `portal.papi.password` | PAPI password - auto-generated | `` |
| `portal.otk.port` | OTK Port, update this to 9443 if migrating from Docker Swarm | `443` |
| `portal.ssoDebug` | SSO Debugging | `false` |
| `portal.hostnameWhiteList` | Hostname whitelist | `` |
| `portal.defaultTenantId` | **Important!** Do not change the default tenant ID unless you have been using a different tenant ID in your previous install/deployment. There is a 15 character limit. See [DNS Configuration](#dns-configuration) for tenant ID character limitations.  | `apim` |
| `portal.registryCredentials` | Used to create image pull secret, see prerequisites | `` |
| `portal.useExistingPullSecret` | Configures Portal Deployment to use **global.pullSecret** as imagePullSecret | `false` |
| `portal.imagePullSecret.enabled` | Configures Portal Deployment to use custom registry, this option is only evaluated only when portal.registryCredentials option is not used | `false` |
| `portal.imagePullSecret.username`          | Custom registry Username | `nil`  |
| `portal.imagePullSecret.password`          | Custom registry Password | `nil`  |


### Certificates
| Parameter                                 | Description                                                                                                          | Default                                                      |
|-------------------------------------------|----------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------|
| `tls.job.enabled` | Enable or disable the TLS Pre-install/upgrade job - if you migrated certificates over from a previous installation and want to keep them then set this to false. During upgrade ensure to set this value to 'false', or else depending on 'tls.job.rotate' value, certificates are recreated | `true` |
| `tls.job.rotate` | One of all, internal, external, none. This rotates the selected set of certificates and upgrades the relevant deployments. This field is considered only when 'tls.job.enabled' is true and helm action is 'upgrade' | `none` |
| `tls.internalSecretName` | Internal Certificate secret name - change this if rotating internal/all certificates | `portal-internal-secret` |
| `tls.externalSecretName` | External Certificate secret name - change this if rotating external/all certificates | `portal-external-secret` |
| `tls.useSignedCertificates` | Use Signed Certificates for Public facing services, requires setting tls.crt,crtChain,key and optionally keyPass | `false` |
| `tls.crt` | Signed Certificate in PEM format | `` |
| `tls.crtChain` | Certificate Chain in PEM format | `` |
| `tls.key` | Private Key in PEM format, if password protected supply .keyPass | `` |
| `tls.keyPass` | Private Key Pass | `` |
| `tls.expiryInDays` | Certificate expiry in days | '1095' |

***To use a signed certificate make sure ```tls.useSignedCertifcates``` is set to true and specify tls.crt (public cert), tls.crtChain (intermediary) and tls.key using --set-file.***

### Ingress Options

| Parameter                                 | Description                                                                                                          | Default                                                      |
|-------------------------------------------|----------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------|
| `ingress.type.kubernetes` | Create a Kubernetes Ingress Object | `true` |
| `ingress.type.openshift` | Create Openshift Services | `false` |
| `ingress.type.secretName` | Certificate Secret Name to be created | `dispatcher-tls` |
| `ingress.create` | Deploy the Nginx subchart as part of this deployment. ***Note:-*** This is a third-party sub chart which is not supported/maintained by Layer7. Included only for reference/sample | `false` |
| `ingress.class.name` | Deploy the Nginx subchart with the specified name | `nginx` |
| `ingress.class.enabled` | Deploy the Nginx subchart with the specified name , if the flag is enabled | `true` |
| `ingress.annotations` | Ingress annotations | `additional annotations that you would like to pass to the Ingress object` |
| `ingress.tenantIds` | A list of tenantIds that you plan to create on the Portal. | `[] - see values.yaml` |
| `ingress.apiVersion` | added for future compatibility, extensions/v1beta1 will soon be deprecated, if you're running 1.18 this will be `networking.k8s.io/v1beta1`  | `extensions/v1beta1` |
| `ingress.additionalLabels` | A list of custom key: value labels | `not set` |

### SMTP Parameters
| Parameter                                 | Description                                                                                                          | Default                                                      |
|-------------------------------------------|----------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------|
| `smtp.host` | SMTP Host | `notinstalled` |
| `smtp.port` | SMTP Port | `notinstalled` |
| `smtp.username` | SMTP Username | `notinstalled` |
| `smtp.password` | SMTP Password | `notinstalled` |
| `smtp.requireSSL` | Require SSL for the SMTP Server | `false` |
| `smtp.cert` | SMTP Server certificate | `notinstalled` |


### Container Deployment Configurations
| Parameter                                                      | Description                                                                                                                  | Default                                                      |
|----------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------| ------------------------------------------------------------ |
| `analytics.forceRedeploy`                                      | Force redeployment during helm upgrade whether there is a change or not                                                      | `false`                                                      |
| `analytics.replicaCount`                                       | Number of analytics nodes                                                                                                    | `1`                                                          |
| `analytics.image.pullPolicy`                                   | Analytics image pull policy                                                                                                  | `IfNotPresent`                                               |
| `analytics.pdb.create`                                         | Create PodDisruptionBudget (PDB) object                                                                                      | `false`                                                      |
| `analytics.pdb.maxUnavailable`                                 | Maximum number of simultaneous unavailable pods                                                                              | `not set`                                                    |
| `analytics.pdb.minAvailable`                                   | Minimum number of available pods                                                                                             | `1`                                                          |
| `analytics.podAnnotations`                                     | Analytics pod annotations settings.                                                                                          | `{} evaluated as a template`                                 |
| `analytics.podSecurityContext`                                 | Analytics pod's security context settings. Overrides global.podSecurityContext settings                                      | `{} evaluated as a template`
| `analytics.containerSecurityContext`                           | Analytics container's security context settings. Overrides global.containerSecurityContext settings                          | `{} evaluated as a template`                                 |
| `analytics.strategy`                                           | Update strategy                                                                                                              | `{} evaluated as a template`                                 |
| `analytics.resources`                                          | Resource request/limits                                                                                                      | `{} evaluated as a template`                                 |
| `analytics.nodeSelector`                                       | Node labels for pod assignment                                                                                               | `{} evaluated as a template`                                 |
| `analytics.tolerations`                                        | Pod tolerations for pod assignment                                                                                           | `{} evaluated as a template`                                 |
| `analytics.affinity`                                           | Affinity for pod assignment                                                                                                  | `{} evaluated as a template`                                 |
| `analytics.additionalLabels`                                   | A list of custom key: value labels                                                                                           | `not set`                                                    |
| `apim.forceRedeploy`                                           | Force redeployment during helm upgrade whether there is a change or not                                                      | `false`                                                      |
| `apim.preflightCheck.enabled`                                  | Resolves a race condition that occurs on slower hardware where apim/ingress starts before other dependent services are ready |`true`                                                      |
| `apim.replicaCount`                                            | Number of APIM nodes                                                                                                         | `1`                                                          |
| `apim.image.pullPolicy`                                        | APIM image pull policy                                                                                                       | `IfNotPresent`                                               |
| `apim.otkDb.name`                                              | APIM OTK Database name                                                                                                       | `otk_db`                                                     |
| `apim.pdb.create`                                              | Create PodDisruptionBudget (PDB) object                                                                                      | `false`                                                      |
| `apim.pdb.maxUnavailable`                                      | Maximum number of simultaneous unavailable pods                                                                              | `not set`                                                    |
| `apim.pdb.minAvailable`                                        | Minimum number of available pods                                                                                             | `1`                                                          |
| `apim.podAnnotations`                                          | APIM pod annotations settings.                                                                                               | `{} evaluated as a template`                                 |
| `apim.podSecurityContext`                                      | APIM pod's security context settings. Overrides global.podSecurityContext settings                                           | `{} evaluated as a template`                                 |
| `apim.containerSecurityContext`                                | APIM container's security context settings. Overrides global.containerSecurityContext settings                               | `{} evaluated as a template`                                 |
| `apim.strategy`                                                | Update strategy                                                                                                              | `{} evaluated as a template`                                 |
| `apim.resources`                                               | Resource request/limits                                                                                                      | `{} evaluated as a template`                                 |
| `apim.nodeSelector`                                            | Node labels for pod assignment                                                                                               | `{} evaluated as a template`                                 |
| `apim.tolerations`                                             | Pod tolerations for pod assignment                                                                                           | `{} evaluated as a template`                                 |
| `apim.affinity`                                                | Affinity for pod assignment                                                                                                  | `{} evaluated as a template`                                 |
| `apim.additionalLabels`                                        | A list of custom key: value labels                                                                                           | `not set`                                                    |
| `apim.additionalEnv.CONFIG_8443_TLS`                           | Enabled Port 8443 TLS Versions                                                                                               | `If not specfied, Portal TLS defaults are enabled` see [Portal TLS Defaults](#portal-tls-defaults)                                                    |
| `apim.additionalEnv.CONFIG_9443_TLS`                           | Enabled Port 9443 TLS Versions                                                                                               | `If not specfied, Portal TLS defaults are enabled` see [Portal TLS Defaults](#portal-tls-defaults)                                                   |
| `apim.additionalEnv.CONFIG_9446_TLS`                           | Enabled Port 9446 TLS Versions                                                                                               | `If not specfied, Portal TLS defaults are enabled` see [Portal TLS Defaults](#portal-tls-defaults)                                                   |
| `apim.additionalEnv.CONFIG_9448_TLS`                           | Enabled Port 9448 TLS Versions                                                                                               | `If not specfied, Portal TLS defaults are enabled` see [Portal TLS Defaults](#portal-tls-defaults)                                                   |
| `apim.additionalEnv.CONFIG_9449_TLS`                           | Enabled Port 9449 TLS Versions                                                                                               | `If not specfied, Portal TLS defaults are enabled` see [Portal TLS Defaults](#portal-tls-defaults)                                                   |
| `apim.additionalEnv.CONFIG_1885_TLS`                           | Enabled Port 1885 TLS Versions                                                                                               | `If not specfied, Portal TLS defaults are enabled` see [Portal TLS Defaults](#portal-tls-defaults)                                                   |
| `apim.additionalEnv.CONFIG_8443_CIPHER_SUITE`                  | Enabled Port 8443 Cipher Suites                                                                                              | `If not specfied, Portal Cipher Suites defaults are enabled` see [Portal Cipher Suites Defaults](#portal-cipher-suites-defaults)                                                   |
| `apim.additionalEnv.CONFIG_9443_CIPHER_SUITE`                  | Enabled Port 9443 Cipher Suites                                                                                              | `If not specfied, Portal Cipher Suites defaults are enabled` see [Portal Cipher Suites Defaults](#portal-cipher-suites-defaults)                                                   |
| `apim.additionalEnv.CONFIG_9446_CIPHER_SUITE`                  | Enabled Port 9446 Cipher Suites                                                                                              | `If not specfied, Portal Cipher Suites defaults are enabled` see [Portal Cipher Suites Defaults](#portal-cipher-suites-defaults)                                                   |
| `apim.additionalEnv.CONFIG_9448_CIPHER_SUITE`                  | Enabled Port 9448 Cipher Suites                                                                                              | `If not specfied, Portal Cipher Suites defaults are enabled` see [Portal Cipher Suites Defaults](#portal-cipher-suites-defaults)                                                   |
| `apim.additionalEnv.CONFIG_9449_CIPHER_SUITE`                  | Enabled Port 9449 Cipher Suites                                                                                              | `If not specfied, Portal Cipher Suites defaults are enabled` see [Portal Cipher Suites Defaults](#portal-cipher-suites-defaults)                                                   |
| `apim.additionalEnv.CONFIG_1885_CIPHER_SUITE`                  | Enabled Port 1885 Cipher Suites                                                                                              | `If not specfied, Portal Cipher Suites defaults are enabled` see [Portal Cipher Suites Defaults](#portal-cipher-suites-defaults)                                                   |
| `authenticator.forceRedeploy`                                  | Force redeployment during helm upgrade whether there is a change or not                                                      | `false`                                                      |
| `authenticator.replicaCount`                                   | Number of authenticator nodes                                                                                                | `1`                                                          |
| `authenticator.javaOptions`                                    | Java Options to pass in                                                                                                      | `-Xms1g -Xmx1g`                                              |
| `authenticator.image.pullPolicy`                               | authenticator image pull policy                                                                                              | `IfNotPresent`                                               |
| `authenticator.pdb.create`                                     | Create PodDisruptionBudget (PDB) object                                                                                      | `false`                                                      |
| `authenticator.pdb.maxUnavailable`                             | Maximum number of simultaneous unavailable pods                                                                              | `not set`                                                    |
| `authenticator.pdb.minAvailable`                               | Minimum number of available pods                                                                                             | `1`                                                          |
| `authenticator.podAnnotations`                                 | authenticator pod annotations settings.                                                                                      | `{} evaluated as a template`                                 |
| `authenticator.podSecurityContext`                             | authenticator pod's security context settings. Overrides global.podSecurityContext settings                                  | `{} evaluated as a template`                                 |
| `authenticator.containerSecurityContext`                       | authenticator container's security context settings. Overrides global.containerSecurityContext settings                      | `{} evaluated as a template`                                 |
| `authenticator.strategy`                                       | Update strategy                                                                                                              | `{} evaluated as a template`                                 |
| `authenticator.resources`                                      | Resource request/limits                                                                                                      | `{} evaluated as a template`                                 |
| `authenticator.nodeSelector`                                   | Node labels for pod assignment                                                                                               | `{} evaluated as a template`                                 |
| `authenticator.tolerations`                                    | Pod tolerations for pod assignment                                                                                           | `{} evaluated as a template`                                 |
| `authenticator.affinity`                                       | Affinity for pod assignment                                                                                                  | `{} evaluated as a template`                                 |
| `authenticator.additionalLabels`                               | A list of custom key: value labels                                                                                           | `not set`                                                    |
| `dispatcher.forceRedeploy`                                     | Force redeployment during helm upgrade whether there is a change or not                                                      | `false`                                                      |
| `dispatcher.replicaCount`                                      | Number of dispatcher nodes                                                                                                   | ``                                                          |
| `dispatcher.image.pullPolicy`                                  | Dispatcher image pull policy                                                                                                 | `IfNotPresent`                                               |
| `dispatcher.pdb.create`                                        | Create PodDisruptionBudget (PDB) object                                                                                      | `false`                                                      |
| `dispatcher.pdb.maxUnavailable`                                | Maximum number of simultaneous unavailable pods                                                                              | `not set`                                                    |
| `dispatcher.pdb.minAvailable`                                  | Minimum number of available pods                                                                                             | `1`                                                          |
| `dispatcher.podAnnotations`                                    | Dispatcher pod annotations settings.                                                                                         | `{} evaluated as a template`                                 |
| `dispatcher.podSecurityContext`                                | Dispatcher pod's security context settings. Overrides global.podSecurityContext settings                                     | `{} evaluated as a template`                                 |
| `dispatcher.containerSecurityContext`                          | Dispatcher container's security context settings. Overrides global.containerSecurityContext settings                         | `{} evaluated as a template`                                 |
| `dispatcher.strategy`                                          | Update strategy                                                                                                              | `{} evaluated as a template`                                 |
| `dispatcher.resources`                                         | Resource request/limits                                                                                                      | `{} evaluated as a template`                                 |
| `dispatcher.nodeSelector`                                      | Node labels for pod assignment                                                                                               | `{} evaluated as a template`                                 |
| `dispatcher.tolerations`                                       | Pod tolerations for pod assignment                                                                                           | `{} evaluated as a template`                                 |
| `dispatcher.affinity`                                          | Affinity for pod assignment                                                                                                  | `{} evaluated as a template`                                 |
| `dispatcher.readinessProbe`                                    | Readiness Probe for Dispatcher                                                                                               | `{} evaluated as a template` <br />`If not specfied, http get request on nginx status gets checked ` |
| `dispatcher.livenessProbe`                                     | Liveness Probe for Dispatcher                                                                                                | `{} evaluated as a template` <br />`If not specfied, http get request on nginx status gets checked ` |
| `dispatcher.additionalEnv.PROBE_IP_RANGE`                      | IP address range in CIDR notation to whitelist readiness and liveness probes for Dispatcher                                  | `not set`                                                    |
| `dispatcher.additionalLabels`                                  | A list of custom key: value labels                                                                                           | `not set`                                                    |
| `dispatcher.additionalEnv.CONFIG_HTTPS_TLS`                    | Enabled HTTPS TLS Versions                                                                                                   | `If not specfied, Portal TLS defaults are enabled` see [Portal TLS Defaults](#portal-tls-defaults)                                                   |
| `dispatcher.additionalEnv.CONFIG_HTTPS_CIPHER_SUITE`           | Enabled HTTPS Cipher Suites                                                                                                  | `If not specfied, Portal Cipher Suites defaults are enabled` see [Portal Cipher Suites Defaults](#portal-cipher-suites-defaults)                                                   |
| `dispatcher.additionalEnv.CONFIG_HOST_ALLOWED_DOMAINS`         | Use &#124; to separate allowed domains. e.g. mydomain1.com &#124; mydomain2.com                                              | `not set`                                                   |
| `dispatcher.additionalEnv.CONFIG_MAX_REQ_PER_MIN_HEALTH_CHECK` | allowed rate limit per minute to the Portal health check endpoint                                                            | 	`6`                                                   |
| `portalData.forceRedeploy`                                     | Force redeployment during helm upgrade whether there is a change or not                                                      | `false`                                                      |
| `portalData.replicaCount`                                      | Number of portal data nodes                                                                                                  | `1`                                                          |
| `portalData.javaOptions`                                       | Java Options to pass in                                                                                                      | `-Xms2g -Xmx2g`                                              |
| `portalData.image.pullPolicy`                                  | Portal-data image pull policy                                                                                                | `IfNotPresent`                                               |
| `portalData.pdb.create`                                        | Create PodDisruptionBudget (PDB) object                                                                                      | `false`                                                      |
| `portalData.pdb.maxUnavailable`                                | Maximum number of simultaneous unavailable pods                                                                              | `not set`                                                    |
| `portalData.pdb.minAvailable`                                  | Minimum number of available pods                                                                                             | `1`                                                          |
| `portalData.strategy`                                          | Update strategy                                                                                                              | `{} evaluated as a template`                                 |
| `portalData.resources`                                         | Resource request/limits                                                                                                      | `{} evaluated as a template`                                 |
| `portalData.nodeSelector`                                      | Node labels for pod assignment                                                                                               | `{} evaluated as a template`                                 |
| `portalData.tolerations`                                       | Pod tolerations for pod assignment                                                                                           | `{} evaluated as a template`                                 |
| `portalData.affinity`                                          | Affinity for pod assignment                                                                                                  | `{} evaluated as a template`                                 |
| `portalData.additionalLabels`                                  | A list of custom key: value labels                                                                                           | `not set`                                                    |
| `portalData.podAnnotations`                                    | Portal-data pod annotations settings.                                                                                        | `{} evaluated as a template`                                 |
| `portalData.podSecurityContext`                                | Portal-data pod's security context settings. Overrides global.podSecurityContext settings                                    | `{} evaluated as a template`                                 |
| `portalData.containerSecurityContext`                          | Portal-data container's security context settings. Overrides global.containerSecurityContext settings                        | `{} evaluated as a template`                                 |
| `portalEnterprise.forceRedeploy`                               | Force redeployment during helm upgrade whether there is a change or not                                                      | `false`                                                      |
| `portalEnterprise.replicaCount`                                | Number of portal-enterprise nodes                                                                                            | `1`                                                          |
| `portalEnterprise.javaOptions`                                 | Java Options to pass in                                                                                                      | `-Xms2g -Xmx2g`                                              |
| `portalEnterprise.image.pullPolicy`                            | Portal enterprise image pull policy                                                                                          | `IfNotPresent`                                               |
| `portalEnterprise.pdb.create`                                  | Create PodDisruptionBudget (PDB) object                                                                                      | `false`                                                      |
| `portalEnterprise.pdb.maxUnavailable`                          | Maximum number of simultaneous unavailable pods                                                                              | `not set`                                                    |
| `portalEnterprise.pdb.minAvailable`                            | Minimum number of available pods                                                                                             | `1`                                                          |
| `portalEnterprise.strategy`                                    | Update strategy                                                                                                              | `{} evaluated as a template`                                 |
| `portalEnterprise.resources`                                   | Resource request/limits                                                                                                      | `{} evaluated as a template`                                 |
| `portalEnterprise.nodeSelector`                                | Node labels for pod assignment                                                                                               | `{} evaluated as a template`                                 |
| `portalEnterprise.tolerations`                                 | Pod tolerations for pod assignment                                                                                           | `{} evaluated as a template`                                 |
| `portalEnterprise.affinity`                                    | Affinity for pod assignment                                                                                                  | `{} evaluated as a template`                                 |
| `portalEnterprise.additionalLabels`                            | A list of custom key: value labels                                                                                           | `not set`                                                    |
| `portalEnterprise.podAnnotations`                              | Portal enterprise pod annotations settings.                                                                                  | `{} evaluated as a template`                                 |
| `portalEnterprise.podSecurityContext`                          | Portal enterprise pod's security context settings. Overrides global.podSecurityContext settings                              | `{} evaluated as a template`                                 |
| `portalEnterprise.containerSecurityContext`                    | Portal enterprise container's security context settings. Overrides global.containerSecurityContext settings                  | `{} evaluated as a template`                                 |
| `portalEnterprise.forceRedeploy`                               | Force redeployment during helm upgrade whether there is a change or not                                                      | `false`                                                      |
| `tenantProvisioner.forceRedeploy`                              | Force redeployment during helm upgrade whether there is a change or not                                                      | `false`                                                      |
| `tenantProvisioner.replicaCount`                               | Number of tenant provisioner nodes                                                                                           | `1`                                                          |
| `tenantProvisioner.javaOptions`                                | Java Options to pass in                                                                                                      | `-Xms512m -Xmx512m`                                          |
| `tenantProvisioner.image.pullPolicy`                           | Tenant provisioner image pull policy                                                                                         | `IfNotPresent`                                               |
| `tenantProvisioner.pdb.create`                                 | Create PodDisruptionBudget (PDB) object                                                                                      | `false`                                                      |
| `tenantProvisioner.pdb.maxUnavailable`                         | Maximum number of simultaneous unavailable pods                                                                              | `not set`                                                   |
| `tenantProvisioner.pdb.minAvailable`                           | Minimum number of available pods                                                                                             | `1`                                                         |
| `tenantProvisioner.strategy`                                   | Update strategy                                                                                                              | `{} evaluated as a template`                                 |
| `tenantProvisioner.resources`                                  | Resource request/limits                                                                                                      | `{} evaluated as a template`                                 |
| `tenantProvisioner.nodeSelector `                              | Node labels for pod assignment                                                                                               | `{} evaluated as a template`                                 |
| `tenantProvisioner.tolerations`                                | Pod tolerations for pod assignment                                                                                           | `{} evaluated as a template`                                 |
| `tenantProvisioner.affinity `                                  | Affinity for pod assignment                                                                                                  | `{} evaluated as a template`                                 |
| `tenantProvisioner.additionalLabels`                           | A list of custom key: value labels                                                                                           | `not set`                                                    |
| `tenantProvisioner.podAnnotations`                             | Tenant provisioner pod annotations settings.                                                                                 | `{} evaluated as a template`                                 |
| `tenantProvisioner.podSecurityContext`                         | Tenant provisioner pod's security context settings. Overrides global.podSecurityContext settings                             | `{} evaluated as a template`                                 |
| `tenantProvisioner.containerSecurityContext`                   | Tenant provisioner container's security context settings. Overrides global.containerSecurityContext settings                 | `{} evaluated as a template`                                 |
| `jobs.nodeSelector`                                            | Node labels for pod assignment                                                                                               | `{} evaluated as a template`                                 |
| `jobs.podAnnotations`                                          | Portal jobs pod annotations settings.                                                                                        | `{} evaluated as a template`                                 |
| `jobs.tolerations`                                             | Pod tolerations for pod assignment                                                                                           | `{} evaluated as a template`                                 |
| `jobs.labels`                                                  | A list of custom key: value labels applied to jobs                                                                           | `not set`                                 |
| `jobs.image.PullPolicy`                                        | Image pull policy applied to jobs                                                                                            | `IfNotPresent`                                 |
| `jobs.podSecurityContext`                                      | Pod's security context settings applied to jobs. Overrides global.podSecurityContext settings                                | `{} evaluated as a template`                                 |
| `jobs.containerSecurityContext`                                | Container's security context settings applied to jobs. Overrides global.containerSecurityContext settings                    | `{} evaluated as a template`                                 |

### Database Node Pool Configurations

#### Common configurations across multiple containers
| Parameter                                                              | Description                                                                                                                                  | Default      | Container                                                                           |
|------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------|--------------|-------------------------------------------------------------------------------------|
| `<container>.additionalEnv.DATABASE_POOL_MINPOOLSIZE`                  | Minimum number of Connections a pool will maintain at any given time                                                                         | `5`          | `portalData`, `portalEnterprise`, `tenantProvisioner`, `analytics`,`ingress` |
| `<container>.additionalEnv.DATABASE_POOL_MAXPOOLSIZE`                  | Maximum number of Connections a pool will maintain at any given time                                                                         | `30`         | `portalData`, `portalEnterprise`, `tenantProvisioner`, `analytics`,`ingress` |
| `<container>.additionalEnv.DATABASE_POOL_CHECKOUTTIMEOUT`              | The number of milliseconds a client calling getConnection() will wait for a Connection to be checked-in or acquired when the pool is exhausted | `30000 (ms)` | `portalData`, `portalEnterprise`, `tenantProvisioner`, `analytics`,`ingress` |
| `<container>.additionalEnv.DATABASE_POOL_MAXSTATEMENTSPERCONNECTION`   | The number of PreparedStatements to be cached for a single pooled Connection                                                                 | `50`         | `portalData`, `portalEnterprise`, `tenantProvisioner`, `analytics`,`ingress` |
| `<container>.additionalEnv.DATABASE_POOL_IDLECONNECTIONTESTPERIOD`     | Test all idle, pooled but unchecked-out connections, every this number of seconds                                                            | `60 seconds` | `portalData`, `portalEnterprise`, `tenantProvisioner`, `analytics`,`ingress` |
| `<container>.additionalEnv.DATABASE_POOL_INITIALPOOLSIZE`              | Number of Connections a pool will try to acquire upon startup                                                                                | `5`          | `portalData`, `portalEnterprise`, `tenantProvisioner`, `analytics`,`ingress` |
| `<container>.additionalEnv.DATABASE_POOL_MAXSTATEMENTS`                | The size of global PreparedStatement cache                                                                                                   | `300`        | `portalData`, `portalEnterprise`, `tenantProvisioner`, `analytics`,`ingress`, |
| `<container>.additionalEnv.DATABASE_POOL_MAXCONNECTIONAGE`             | A Connection older than maxConnectionAge will be destroyed and purged from the pool                                                          | `0 seconds`  | `portalData`, `portalEnterprise`, `tenantProvisioner`, `analytics`,`ingress` |
| `<container>.additionalEnv.DATABASE_POOL_MAXIDLETIME`                  | Seconds a Connection can remain pooled but unused before being discarded.                                                                    | `0 seconds`  | `portalData`, `portalEnterprise`, `tenantProvisioner`, `analytics`,`ingress` |
| `<container>.additionalEnv.DATABASE_POOL_MAXIDLETIMEEXCESSCONNECTIONS` | Number of seconds that Connections in excess of minPoolSize should be permitted to remain idle in the pool before being culled               | `0 seconds`  | `portalData`, `portalEnterprise`, `tenantProvisioner`, `analytics`,`ingress` |
| `<container>.additionalEnv.DATABASE_POOL_SOCKETTIMEOUT`                | The number of milliseconds on network socket operations specified as socketTimeout property in the JDBC URL. Value 0 means no timeout.      | `120000 (ms)`| `portalData`, `portalEnterprise`, `tenantProvisioner`,`ingress` |
| `<container>.additionalEnv.DATABASE_POOL_CONNECTTIMEOUT`               | The number of milliseconds timeout for socket connect specified as connectTimeout property in the JDBC URL.  Value 0 means no timeout.      | `10000 (ms)` | `portalData`, `portalEnterprise`, `tenantProvisioner`, `analytics`,`ingress` |

#### Authenticator specific configurations
| Parameter                                                           | Description                                                                                                                                   | Default       |
|---------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------|---------------|
| `authenticator.additionalEnv.DATABASE_POOL_MAXPOOLSIZE`             | Maximum number of Connections a pool will maintain at any given time                                                                          | `30`          | 
| `authenticator.additionalEnv.DATABASE_POOL_CHECKOUTTIMEOUT`         | The number of milliseconds a client calling getConnection() will wait for a Connection to be checked-in or acquired when the pool is exhausted | `30000 ms`    |
| `authenticator.additionalEnv.DATABASE_POOL_PINGCONNECTIONNOTUSERFOR` | Ping the database to make sure connection is still good if it has not been used in this many milliseconds,                                    | `5000 ms`     |
| `authenticator.additionalEnv.DATABASE_POOL_PINGENABLED`             | Periodically pings and tests the connections in connection pool if they are alive and responsive                                              | `true`        |
| `authenticator.additionalEnv.DATABASE_POOL_PINGQUERY`               | SQL query to be executed when connection pool is pinged to test the health of connections.                                                    | `select1`     |
| `authenticator.additionalEnv.DATABASE_POOL_MAXIMUMIDLECONNECTIONS`  | The maximum number of idle connections                                                                                                        | `10`          |
| `authenticator.additionalEnv.DATABASE_POOL_SOCKETTIMEOUT`           | The number of milliseconds on network socket operations specified as socketTimeout property in the JDBC URL. Value 0 means no timeout.        | `120000 (ms)` |
| `authenticator.additionalEnv.DATABASE_POOL_CONNECTTIMEOUT`          | The number of milliseconds timeout for socket connect specified as connectTimeout property in the JDBC URL.  Value 0 means no timeout.        | `10000 (ms)`  |


#### Additional portalData configurations for File Repository Database
| Parameter                                                                             | Description                                                                                                                                    | Default          |
|---------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|------------------|
| `portalData.additionalEnv.FILE_REPOSITORY_DATABASE_POOL_MINPOOLSIZE`                  | Minimum number of Connections a pool will maintain at any given time                                                                           | `5`              |
| `portalData.additionalEnv.FILE_REPOSITORY_DATABASE_POOL_MAXPOOLSIZE`                  | Maximum number of Connections a pool will maintain at any given time                                                                           | `30`             |                       
| `portalData.additionalEnv.FILE_REPOSITORY_DATABASE_POOL_CHECKOUTTIMEOUT`              | The number of milliseconds a client calling getConnection() will wait for a Connection to be checked-in or acquired when the pool is exhausted | `30000 (ms)`     |           
| `portalData.additionalEnv.FILE_REPOSITORY_DATABASE_POOL_MAXSTATEMENTSPERCONNECTION`   | The number of PreparedStatements to be cached for a single pooled Connection                                                                   | `50`             |
| `portalData.additionalEnv.FILE_REPOSITORY_DATABASE_POOL_IDLECONNECTIONTESTPERIOD`     | Test all idle, pooled but unchecked-out connections, every this number of seconds                                                              | `60 seconds`     |
| `portalData.additionalEnv.FILE_REPOSITORY_DATABASE_POOL_INITIALPOOLSIZE`              | Number of Connections a pool will try to acquire upon startup                                                                                  | `5`              |
| `portalData.additionalEnv.FILE_REPOSITORY_DATABASE_POOL_MAXSTATEMENTS`                | The size of global PreparedStatement cache                                                                                                     | `300`            |
| `portalData.additionalEnv.FILE_REPOSITORY_DATABASE_POOL_MAXCONNECTIONAGE`             | A Connection older than maxConnectionAge will be destroyed and purged from the pool                                                            | `0 seconds`      |
| `portalData.additionalEnv.FILE_REPOSITORY_DATABASE_POOL_MAXIDLETIME`                  | Seconds a Connection can remain pooled but unused before being discarded.                                                                      | `0 seconds`      |
| `portalData.additionalEnv.FILE_REPOSITORY_DATABASE_POOL_MAXIDLETIMEEXCESSCONNECTIONS` | Number of seconds that Connections in excess of minPoolSize should be permitted to remain idle in the pool before being culled                 | `0 seconds`      |
| `portalData.additionalEnv.FILE_REPOSITORY_DATABASE_POOL_SOCKETTIMEOUT`                | The number of milliseconds on network socket operations specified as socketTimeout property in the JDBC URL. Value 0 means no timeout.         | `120000 (ms)`    | 
| `portalData.additionalEnv.FILE_REPOSITORY_DATABASE_POOL_CONNECTTIMEOUT`               | The number of milliseconds timeout for socket connect specified as connectTimeout property in the JDBC URL.  Value 0 means no timeout.         | `10000 (ms)`     |



#### Additional tenantProvisioner configurations for Portal Database
| Parameter                                                                           | Description                                                                                                                                    | Default      |
|-------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|--------------|
| `tenantProvisioner.additionalEvn.PORTAL_DATABASE_POOL_MINPOOLSIZE`                  | Minimum number of Connections a pool will maintain at any given time                                                                           | `5`          |
| `tenantProvisioner.additionalEvn.PORTAL_DATABASE_POOL_MAXPOOLSIZE`                  | Maximum number of Connections a pool will maintain at any given time                                                                           | `30`         | 
| `tenantProvisioner.additionalEvn.PORTAL_DATABASE_POOL_CHECKOUTTIMEOUT`              | The number of milliseconds a client calling getConnection() will wait for a Connection to be checked-in or acquired when the pool is exhausted | `30000 (ms)` |
| `tenantProvisioner.additionalEvn.PORTAL_DATABASE_POOL_MAXSTATEMENTSPERCONNECTION`   | The number of PreparedStatements to be cached for a single pooled Connection                                                                   | `50`         |
| `tenantProvisioner.additionalEvn.PORTAL_DATABASE_POOL_IDLECONNECTIONTESTPERIOD`     | Test all idle, pooled but unchecked-out connections, every this number of seconds                                                              | `60 seconds` |
| `tenantProvisioner.additionalEvn.PORTAL_DATABASE_POOL_INITIALPOOLSIZE`              | Number of Connections a pool will try to acquire upon startup                                                                                  | `5`          |
| `tenantProvisioner.additionalEvn.PORTAL_DATABASE_POOL_MAXSTATEMENTS`                | The size of global PreparedStatement cache                                                                                                     | `300`        |
| `tenantProvisioner.additionalEvn.PORTAL_DATABASE_POOL_MAXCONNECTIONAGE`             | A Connection older than maxConnectionAge will be destroyed and purged from the pool                                                            | `0 seconds`  |
| `tenantProvisioner.additionalEvn.PORTAL_DATABASE_POOL_MAXIDLETIME`                  | Seconds a Connection can remain pooled but unused before being discarded.                                                                      | `0 seconds`  |
| `tenantProvisioner.additionalEvn.PORTAL_DATABASE_POOL_MAXIDLETIMEEXCESSCONNECTIONS` | Number of seconds that Connections in excess of minPoolSize should be permitted to remain idle in the pool before being culled                 | `0 seconds`  |
| `tenantProvisioner.additionalEvn.PORTAL_DATABASE_POOL_SOCKETTIMEOUT`                | The number of milliseconds on network socket operations specified as socketTimeout property in the JDBC URL. Value 0 means no timeout.         | `120000 (ms)`|
| `tenantProvisioner.additionalEvn.PORTAL_DATABASE_POOL_CONNECTTIMEOUT`               | The number of milliseconds timeout for socket connect specified as connectTimeout property in the JDBC URL.  Value 0 means no timeout.         | `10000 (ms)` |
### Portal TLS Defaults 
Portal TLS defaults if the parameters are not set.
| Parameter                            | Description                                                  | Default                                                      |
| ------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| `apim.additionalEnv.CONFIG_8443_TLS` | APIM ingress Port 8443 TLS defaults if not specified                          | `TLSv1.2,TLSv1.3`                                                     |
| `apim.additionalEnv.CONFIG_9443_TLS` | APIM ingress Port 9443 TLS defaults if not specified                          | `TLSv1.2,TLSv1.3`                                                    |
| `apim.additionalEnv.CONFIG_9446_TLS` | APIM ingress Port 9446 TLS defaults if not specified                          | `TLSv1.2,TLSv1.3`                                                    |
| `apim.additionalEnv.CONFIG_9448_TLS` | APIM ingress Port 9448 TLS defaults if not specified                          | `TLSv1.2,TLSv1.3`                                                    |
| `apim.additionalEnv.CONFIG_9449_TLS` | APIM ingress Port 9449 TLS defaults if not specified                          | `TLSv1.2,TLSv1.3`                                                    |
| `apim.additionalEnv.CONFIG_1885_TLS` | APIM ingress Port 1885 TLS defaults if not specified                           | `TLSv1.2,TLSv1.3`                                                    |
| `apim.additionalEnv.CONFIG_9449_TLS` | APIM ingress Port 9449 TLS defaults if not specified                          | `TLSv1.2,TLSv1.3`                                                    |
| `apim.additionalEnv.CONFIG_1885_TLS` | APIM ingress Port 1885 TLS defaults if not specified                           | `TLSv1.2,TLSv1.3`                                                    |
| `dispatcher.additionalEnv.CONFIG_HTTPS_TLS` | Dispatcher HTTPS TLS defaults if not specified                            | `TLSv1.2,TLSv1.3`                                                  |

## Portal Cipher Suites Defaults
Portal Cipher Suites defaults if the parameters are not set.
| Parameter                            | Description                                                  | Default                                                      |
| ------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| `apim.additionalEnv.CONFIG_8443_CIPHER_SUITE` | APIM ingress Port 8443 Cipher Suites defaults if not specified       | `TLS_AES_256_GCM_SHA384,TLS_AES_128_GCM_SHA256,TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384,TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA384,TLS_ECDH_RSA_WITH_AES_256_CBC_SHA384,TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA,TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA,TLS_ECDH_RSA_WITH_AES_256_CBC_SHA,TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256,TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA256,TLS_ECDH_RSA_WITH_AES_128_CBC_SHA256,TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA,TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA,TLS_ECDH_RSA_WITH_AES_128_CBC_SHA,TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384,TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256,TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384,TLS_ECDH_ECDSA_WITH_AES_256_GCM_SHA384,TLS_ECDH_RSA_WITH_AES_256_GCM_SHA384,TLS_DHE_RSA_WITH_AES_256_GCM_SHA384,TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256,TLS_ECDH_ECDSA_WITH_AES_128_GCM_SHA256,TLS_ECDH_RSA_WITH_AES_128_GCM_SHA256,TLS_DHE_RSA_WITH_AES_128_GCM_SHA256`                                                    |
| `apim.additionalEnv.CONFIG_9443_CIPHER_SUITE` | APIM ingress Port 9443 Cipher Suites defaults if not specified       | `TLS_AES_256_GCM_SHA384,TLS_AES_128_GCM_SHA256,TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384,TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA384,TLS_ECDH_RSA_WITH_AES_256_CBC_SHA384,TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA,TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA,TLS_ECDH_RSA_WITH_AES_256_CBC_SHA,TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256,TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA256,TLS_ECDH_RSA_WITH_AES_128_CBC_SHA256,TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA,TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA,TLS_ECDH_RSA_WITH_AES_128_CBC_SHA,TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384,TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256,TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384,TLS_ECDH_ECDSA_WITH_AES_256_GCM_SHA384,TLS_ECDH_RSA_WITH_AES_256_GCM_SHA384,TLS_DHE_RSA_WITH_AES_256_GCM_SHA384,TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256,TLS_ECDH_ECDSA_WITH_AES_128_GCM_SHA256,TLS_ECDH_RSA_WITH_AES_128_GCM_SHA256,TLS_DHE_RSA_WITH_AES_128_GCM_SHA256`                                                    |
| `apim.additionalEnv.CONFIG_9446_CIPHER_SUITE` | APIM ingress Port 9446 Cipher Suites defaults if not specified       | `TLS_AES_256_GCM_SHA384,TLS_AES_128_GCM_SHA256,TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384,TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384,TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA,TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384,TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256,TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256,TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA,TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256,TLS_ECDHE_ECDSA_WITH_RC4_128_SHA,TLS_ECDHE_RSA_WITH_RC4_128_SHA,TLS_DHE_RSA_WITH_AES_256_GCM_SHA384,TLS_DHE_RSA_WITH_AES_128_GCM_SHA256,TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA,TLS_ECDH_RSA_WITH_AES_256_CBC_SHA,TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA,TLS_ECDH_RSA_WITH_AES_128_CBC_SHA,TLS_ECDH_ECDSA_WITH_RC4_128_SHA,TLS_ECDH_RSA_WITH_RC4_128_SHA`                                                    |
| `apim.additionalEnv.CONFIG_9448_CIPHER_SUITE` | APIM ingress Port 9448 Cipher Suites defaults if not specified       | `TLS_AES_256_GCM_SHA384,TLS_AES_128_GCM_SHA256,TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384,TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384,TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA,TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384,TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256,TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256,TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA,TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256,TLS_ECDHE_ECDSA_WITH_RC4_128_SHA,TLS_ECDHE_RSA_WITH_RC4_128_SHA,TLS_DHE_RSA_WITH_AES_256_GCM_SHA384,TLS_DHE_RSA_WITH_AES_128_GCM_SHA256,TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA,TLS_ECDH_RSA_WITH_AES_256_CBC_SHA,TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA,TLS_ECDH_RSA_WITH_AES_128_CBC_SHA,TLS_ECDH_ECDSA_WITH_RC4_128_SHA,TLS_ECDH_RSA_WITH_RC4_128_SHA`                                                    |
| `apim.additionalEnv.CONFIG_9449_CIPHER_SUITE` | APIM ingress Port 9449 Cipher Suites defaults if not specified       | `TLS_AES_256_GCM_SHA384,TLS_AES_128_GCM_SHA256,TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384,TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384,TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA,TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384,TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256,TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256,TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA,TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256,TLS_ECDHE_ECDSA_WITH_RC4_128_SHA,TLS_ECDHE_RSA_WITH_RC4_128_SHA,TLS_DHE_RSA_WITH_AES_256_GCM_SHA384,TLS_DHE_RSA_WITH_AES_128_GCM_SHA256,TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA,TLS_ECDH_RSA_WITH_AES_256_CBC_SHA,TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA,TLS_ECDH_RSA_WITH_AES_128_CBC_SHA,TLS_ECDH_ECDSA_WITH_RC4_128_SHA,TLS_ECDH_RSA_WITH_RC4_128_SHA`                                                    |
| `apim.additionalEnv.CONFIG_1885_CIPHER_SUITE` | APIM ingress Port 1885 Cipher Suites defaults if not specified       | `TLS_AES_256_GCM_SHA384,TLS_AES_128_GCM_SHA256,TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384,TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384,TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA,TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384,TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384,TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA,TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256,TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256,TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA,TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256,TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256,TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA,TLS_ECDHE_ECDSA_WITH_RC4_128_SHA,TLS_ECDHE_RSA_WITH_RC4_128_SHA,TLS_DHE_RSA_WITH_AES_256_GCM_SHA384,TLS_DHE_RSA_WITH_AES_256_CBC_SHA,TLS_DHE_RSA_WITH_AES_128_GCM_SHA256,TLS_DHE_RSA_WITH_AES_128_CBC_SHA,TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA,TLS_ECDH_RSA_WITH_AES_256_CBC_SHA,TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA,TLS_ECDH_RSA_WITH_AES_128_CBC_SHA,TLS_ECDH_ECDSA_WITH_RC4_128_SHA,TLS_ECDH_RSA_WITH_RC4_128_SHA`                                                    |
| `dispatcher.additionalEnv.CONFIG_HTTPS_CIPHER_SUITE` | Dispatcher HTTPS Cipher Suites defaults if not specified      | `TLS_AES_256_GCM_SHA384,TLS_AES_128_GCM_SHA256,ECDHE_RSA_AES128_GCM_SHA256,ECDHE_ECDSA_AES128_GCM_SHA256,ECDHE_RSA_AES256_GCM_SHA384,ECDHE_ECDSA_AES256_GCM_SHA384,DHE_RSA_AES128_GCM_SHA256,DHE_DSS_AES128_GCM_SHA256,kEDH+AESGCM,ECDH_RSA_AES128_SHA256,ECDHE_ECDSA_AES128_SHA256,ECDHE_ECDSA_AES128_SHA,ECDHE_ECDSA_AES256_SHA384,ECDHE_ECDSA_AES256_SHA,DES_RSA_AES128_SHA256,DHE_RSA_AES128_SHA,DHE_DSS_AES128_SHA256,DHE_RSA_AES256_SHA256,DHE_DSS_AES256_SHA,DHE_RSA_AES256_SHA,!aNULL,!eNULL,!EXPORT,!DES,!RC4,!3DES,!MD5,!PSK`                                                    |
### Portal Supported TLS Versions
| Name                            | Description                                                  | Supported TLS Versions                                                      |
| ------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| `apim` | APIM ingress HTTPS/MQTT-TLS supported TLS Versions       | `TLSv1.0,TLSv1.1,TLSv1.2,TLSv1.3`                                                    |
| `dispatcher` | Dispatcher HTTPS supported TLS Versions            | `TLSv1.0,TLSv1.1,TLSv1.2,TLSv1.3`                                                    |

### Portal Supported Cipher Suites
| Name                            | Description                                                  | Supported TLS Versions                                                      |
| ------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| `apim` | APIM ingress HTTPS/MQTT-TLS supported Cipher Suites       | `TLS_AES_256_GCM_SHA384,TLS_AES_128_GCM_SHA256,TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384,TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384,TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256,TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256,TLS_ECDH_ECDSA_WITH_AES_256_GCM_SHA384,TLS_ECDH_RSA_WITH_AES_256_GCM_SHA384,TLS_DHE_RSA_WITH_AES_256_GCM_SHA384,TLS_ECDH_ECDSA_WITH_AES_128_GCM_SHA256,TLS_ECDH_RSA_WITH_AES_128_GCM_SHA256,TLS_DHE_RSA_WITH_AES_128_GCM_SHA256,TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384,TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384,TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256,TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256,TLS_DHE_RSA_WITH_AES_256_CBC_SHA256,TLS_DHE_RSA_WITH_AES_128_CBC_SHA256,TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA384,TLS_ECDH_RSA_WITH_AES_256_CBC_SHA384,TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA256,TLS_ECDH_RSA_WITH_AES_128_CBC_SHA256,TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA,TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA,TLS_DHE_RSA_WITH_AES_256_CBC_SHA,TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA,TLS_ECDH_RSA_WITH_AES_256_CBC_SHA,TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA,TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA,TLS_DHE_RSA_WITH_AES_128_CBC_SHA,TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA,TLS_ECDH_RSA_WITH_AES_128_CBC_SHA,TLS_RSA_WITH_AES_256_GCM_SHA384,TLS_RSA_WITH_AES_128_GCM_SHA256,TLS_RSA_WITH_AES_256_CBC_SHA256,TLS_RSA_WITH_AES_128_CBC_SHA256,TLS_RSA_WITH_AES_256_CBC_SHA,TLS_RSA_WITH_AES_128_CBC_SHA`                                                    |
| `dispatcher` | Dispatcher HTTPS supported Cipher Suites            | `TLS_AES_256_GCM_SHA384,TLS_AES_128_GCM_SHA256,ECDHE_RSA_AES128_GCM_SHA256,ECDHE_ECDSA_AES128_GCM_SHA256,ECDHE_RSA_AES256_GCM_SHA384,ECDHE_ECDSA_AES256_GCM_SHA384,DHE_RSA_AES128_GCM_SHA256,DHE_DSS_AES128_GCM_SHA256,kEDH+AESGCM,ECDH_RSA_AES128_SHA256,ECDHE_ECDSA_AES128_SHA256,ECDHE_ECDSA_AES128_SHA,ECDHE_ECDSA_AES256_SHA384,ECDHE_ECDSA_AES256_SHA,DES_RSA_AES128_SHA256,DHE_RSA_AES128_SHA,DHE_DSS_AES128_SHA256,DHE_RSA_AES256_SHA256,DHE_DSS_AES256_SHA,DHE_RSA_AES256_SHA,!aNULL,!eNULL,!EXPORT,!DES,!RC4,!3DES,!MD5,!PSK`                                                    |
                                                    |

### Portal Request XSS Filter
The value of this variable should contain rules for sanitizing malicious scripts
that exist in a HTTP request.  The value must be zipped and base64 encoded.

Run the following commands to create the zipped and base64 encoded value:
```
    $ zip output.zip your_policy_file.xml
    $ cat output.zip | base64
```
Note: the output from base64 should not contain any line breaks.
Take the base64 output and set it to the variable below and restart portal stack.

| Environment Variable                                 | Description                                                                                                          |
|------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------|
| `portalData.additionalEnv.ANTISAMY_FILTER_POLICY`    | Zipped policy file in base64 encoded format|
| `authenticator.additionalEnv.ANTISAMY_FILTER_POLICY` | Zipped policy file in base64 encoded format|


### Audit Event Logs
Audit event log purging is enabled and set to 365 days retention by default. Set
this variable to customize the retention period. Set the value to 0 to disable
this feature.

| Environment Variable                                | Description                          |
|-----------------------------------------------------|--------------------------------------|
| `portalData.additionalEnv.AUDIT_LOG_RETENTION_DAYS` | The number of days of logs to retain |
| `portalData.additionalEnv.AUDIT_LOG_TRUNCATE_BATCH_SIZE` | The max number of logs to be removed during a single interval |
| `portalData.additionalEnv.AUDIT_LOG_TRUNCATE_FREQ_MIN` | The frequency of log truncation intervals in minutes  |

### RBAC Parameters
| Parameter                                 | Description                                                                                                          | Default                                                      |
|-------------------------------------------|----------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------|
| `serviceAccount.create` | Enable creation of ServiceAccount for Portal Deployments | `true` |
| `serviceAccount.name` | Name of the created serviceAccount | Generated using the `portal.fullname` template |
| `rbac.create`| Create and use RBAC resources |`true`|
| `druid.serviceAccount.create`| Enable creation of ServiceAccount for Druid |`true`|
| `druid.serviceAccount.name`| Name of the created serviceAccount | Generated using the `portal.fullname` template |
| `rabbitmq.serviceAccount.create`| Enable creation of ServiceAccount for Bitnami RabbitMQ |`true`|
| `rabbitmq.serviceAccount.name`| Name of the created serviceAccount | Generated using the `portal.fullname` template |
| `rabbitmq.rbac.create`| Create & use RBAC resources |`true`|
| `rabbitmq.volumePermissions.enabled` | Enable init container that changes the owner and group of the persistent volume(s) mountpoint to `runAsUser:fsGroup`. After enabling set the appropriate runAsUser and fsGroup values |`false`|
| `rabbitmq.podSecurityContext.fsGroup` | Set RabbitMQ pod's Security Context fsGroup | `1001` |
| `rabbitmq.containerSecurityContext.runAsUser` | Set RabbitMQ containers' Security Context runAsUser | `1001` |
| `ingress-nginx.podSecurityPolicy.enabled`| Enable Pod Security Policy for Nginx |`true`|
| `ingress-nginx.serviceAccount.create`| Enable creation of ServiceAccount for Nginx |`true`|
| `ingress-nginx.serviceAccount.name`| Name of the created serviceAccount | Generated using the `portal.fullname` template |
| `ingress-nginx.rbac.create`| Create & use RBAC resources |`true`|


#### Roles Required
If RBAC is required and a set service account is in use, the following roles must be bound to it.

```
...
*batch-reader*
- apiGroups: ["batch"]
  resources: ["jobs"]
  verbs: ["get"]
...
*cert-update*
rules:
- apiGroups: [""]
  resources: ["secrets"]
  verbs: ["get", "create", "update"]
...
*rabbitmq*
rules:
  - apiGroups: [""]
    resources: ["endpoints"]
    verbs: ["get"]
  - apiGroups: [""]
    resources: ["events"]
    verbs: ["create"]
```

#### FS Permissions
If a strict PodSecurityPolicy is enforced, the following users/groups must be allowed.

```
Portal Core
...
*mysql*
  podSecurityContext:
    enabled: true
    fsGroup: 100
  containerSecurityContext:
    enabled: true
    runAsUser: 1001
...
*rabbitmq*
  podSecurityContext:
    enabled: true
    fsGroup: 1001
    runAsUser: 1001
...
Portal Analytics

*historical*
  securityContext:
    fsGroup: 1010
*kafka*
  securityContext:
    fsGroup: 1010
*minio*
  securityContext:
    fsGroup: 1010
*zookeeper*
  securityContext:
    fsGroup: 1010
```

### Telemetry Parameters
| Parameter                                 | Description                                                                                                          | Default                                                      |
|-------------------------------------------|----------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------|
| `telemetry.plaEnabled` | (For PLA customers) Set to **true** to turn on telemetry service as per your agreement, otherwise **false**. **Tip:** For more information on telemetry, see [Licensing and Telemetry](https://techdocs.broadcom.com/us/en/ca-enterprise-software/layer7-api-management/api-developer-portal/5-0/introduction-layer7-api-developer-portal/licensing-and-telemetry.html) ![image](https://img.icons8.com/small/1x/external-link.png) and [Configure Telemetry](https://techdocs.broadcom.com/us/en/ca-enterprise-software/layer7-api-management/api-developer-portal/5-0/install-configure-and-upgrade/install-portal-on-docker-swarm/install-and-configure-api-portal/configure-telemetry.html) ![image](https://img.icons8.com/small/1x/external-link.png)  | `false` |
| `telemetry.usageType` | The telemetry service behavior | `PRODUCTION` |
| `telemetry.domainName` | Domain name of telemetry service. | `` |
| `telemetry.siteId` |  Site ID of the telemetry service | `` |
| `telemetry.chargebackId` | Chargeback ID of the telemetry service | `_` |
| `telemetry.proxy.url` |  Proxy URL, required if you're using a proxy to communicate with the telemetry service. | `_` |
| `telemetry.proxy.username` | Proxy username | `_` |
| `telemetry.proxy.password` | Proxy password | `_` |


### Portal Images
| Parameter                                 | Description                                                                                                          | Default                                                      |
|-------------------------------------------|----------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------|
| `image.dispatcher` | dispatcher image | `dispatcher:5.3.3` |
| `image.apim` | APIM ingress image | `ingress:5.3.3` |
| `image.enterprise` | portal-enterprise image | `portal-enterprise:5.3.3` |
| `image.data` | portal-data image | `portal-data:5.3.3` |
| `image.tps` | tenant provisioner image | `tenant-provisioning-service:5.3.3` |
| `image.analytics` | Analytics image | `analytics-server:5.3.3` |
| `image.authenticator` | Authenticator image | `authenticator:5.3.3` |
| `image.dbUpgrade` | db upgrade image | `db-upgrade-portal:5.3.3` |
| `image.rbacUpgrade` | Analytics image, per Portal version | `db-upgrade-rbac:5.3.3` |
| `image.upgradeVerify` | Upgrade verification image | `upgrade-verify:5.3.3` |
| `image.tlsManager` | TLS manager image | `tls-automator:5.3.3` |

## Subcharts
For Production, use an external MySQL Server.

## Druid
The following table lists the configured parameters of the Druid Subchart:

| Parameter                        | Description                               | Default                                                      |
| -----------------------------    | -----------------------------------       | -----------------------------------------------------------  |
| `druid.serviceAccount.create` | Enable creation of ServiceAccount for the Druid Chart   | `true` |
| `druid.serviceAccount.name` |  Name of the created serviceAccount   | Generated using the `druid.fullname` template` |
| `druid.persistence.storage.historical` | Historical PVC Size   | `50Gi` |
| `druid.persistence.storage.minio` | Minio PVC Size   | `40Gi` |
| `druid.persistence.storage.kafka` | Kafka PVC Size   | `10Gi` |
| `druid.persistence.storage.zookeeper` | Zookeeper PVC Size   | `10Gi` |
| `druid.minio.pdb.create` | Create PodDisruptionBudget (PDB) object   | `false` |
| `druid.minio.pdb.maxUnavailable` | Maximum number of simultaneous unavailable pods   | `not set` |
| `druid.minio.pdb.minAvailable` | Minimum number of available pods   | `not set` |
| `druid.minio.replicaCount` | Number of minio nodes. Minio replication count cannot be changed after Portal is installed.  | `1` |
| `druid.minio.image.pullPolicy`| Minio image pull policy   | `IfNotPresent` |
| `druid.minio.auth.secretName` | The name of the secret that stores Minio Credentials   | `true` |
| `druid.minio.auth.access_key` | Minio access key   | `auto-generated` |
| `druid.minio.auth.secret_key` | Minio secret key   | `auto-generated` |
| `druid.minio.cloudStorage` | Enable Cloud Storage for Minio. GCP, AWS, Azure   | `false` |
| `druid.minio.bucketName` | Minio bucket name - ensure that this is updated if using cloud storage. Minio will attempt to create the bucket if it doesnot exist, it is recommended that you create the bucket in the relevant provider prior to installing this chart.   | `api-metrics` |
| `druid.minio.s3gateway.enabled` | Use minio as Amazon S3 (Simple Storage Service) gateway - https://docs.minio.io/docs/minio-gateway-for-s3   | `false` |
| `druid.minio.s3gateway.serviceEndpoint` | AWS S3 service endpoint if required   | `nil` |
| `druid.minio.s3gateway.accessKey` | AWS Access Key that has S3 access   | `nil` |
| `druid.minio.s3gateway.secret_key` | AWS Secret Key that has S3 access    | `nil` |
| `druid.minio.gcsgateway.enabled` | Use minio as GCS (Google Cloud Storage) gateway - https://docs.minio.io/docs/minio-gateway-for-gcs   | `false` |
| `druid.minio.gcsgateway.gcsKeyJson` | Google credentials JSON   | `nil` |
| `druid.minio.gcsgateway.projectId` | GCP Project ID   | `nil` |
| `druid.minio.azuregateway.enabled` | Use minio as an azure blob gateway - https://docs.minio.io/docs/minio-gateway-for-azure   | `false` |
| `druid.minio.resources` | Resource request/limits   | `{} evaluated as a template` |
| `druid.minio.nodeSelector`| Node labels for pod assignment   | `{} evaluated as a template` |
| `druid.minio.tolerations` | Pod tolerations for pod assignment   | `{} evaluated as a template` |
| `druid.minio.affinity` | Affinity for pod assignment   | `{} evaluated as a template` |
| `druid.minio.additionalLabels` | A list of custom key: value labels | `not set` |
| `druid.minio.podAnnotations`   | Minio pod annotations settings.                               | `{} evaluated as a template`                                 |
| `druid.minio.podSecurityContext` | Minio pod's security context settings. Overrides global.podSecurityContext settings                                          | `{} evaluated as a template`                                 |
| `druid.minio.containerSecurityContext` | Minio container's security context settings. Overrides global.containerSecurityContext settings                              | `{} evaluated as a template`                                 |
| `druid.zookeeper.pdb.create` | Create PodDisruptionBudget (PDB) object   | `false` |
| `druid.zookeeper.pdb.maxUnavailable` | Maximum number of simultaneous unavailable pods   | `not set` |
| `druid.zookeeper.pdb.minAvailable` | Minimum number of available pods   | `not set` |
| `druid.zookeeper.replicaCount` | Number of zookeeper nodes. It should maintain a quorum. Preferred for HA is 3 or odd counts.   | `1` |
| `druid.zookeeper.image.pullPolicy` | Zookeeper image pull policy   | `IfNotPresent` |
| `druid.zookeeper.resources` | Resource request/limits   | `{} evaluated as a template` |
| `druid.zookeeper.nodeSelector` | Node labels for pod assignment   | `{} evaluated as a template` |
| `druid.zookeeper.tolerations` | Pod tolerations for pod assignment   | `{} evaluated as a template` |
| `druid.zookeeper.affinity` | Affinity for pod assignment   | `{} evaluated as a template` |
| `druid.zookeeper.additionalLabels` | A list of custom key: value labels | `not set` |
| `druid.zookeeper.podAnnotations`   | Zookeeper pod annotations settings.                               | `{} evaluated as a template`                                 |
| `druid.zookeeper.podSecurityContext` | Zookeeper pod's security context settings. Overrides global.podSecurityContext settings                                          | `{} evaluated as a template`                                 |
| `druid.zookeeper.containerSecurityContext` | Zookeeper container's security context settings. Overrides global.containerSecurityContext settings                              | `{} evaluated as a template`                                 |
| `druid.coordinator.pdb.create` | Create PodDisruptionBudget (PDB) object   | `false` |
| `druid.coordinator.pdb.maxUnavailable` | Maximum number of simultaneous unavailable pods   | `not set` |
| `druid.coordinator.pdb.minAvailable` | Minimum number of available pods   | `not set` |
| `druid.coordinator.replicaCount` | Number of coordinator nodes   | `1` |
| `druid.coordinator.image.pullPolicy` | Coordinator image pull policy  | `IfNotPresent` |
| `druid.coordinator.resources` | Resource request/limits   | `{} evaluated as a template` |
| `druid.coordinator.nodeSelector` | Node labels for pod assignment   | `{} evaluated as a template` |
| `druid.coodinator.tolerations` | Pod tolerations for pod assignment   | `{} evaluated as a template` |
| `druid.coordinator.affinity` | Affinity for pod assignment   | `{} evaluated as a template` |
| `druid.coordinator.additionalLabels` | A list of custom key: value labels | `not set` |
| `druid.coordinator.podAnnotations`   | Coordinator pod annotations settings.                               | `{} evaluated as a template`                                 |
| `druid.coordinator.podSecurityContext` | Coordinator pod's security context settings. Overrides global.podSecurityContext settings                                          | `{} evaluated as a template`                                 |
| `druid.coordinator.containerSecurityContext` | Coordinator container's security context settings. Overrides global.containerSecurityContext settings                              | `{} evaluated as a template`                                 |
| `druid.kafka.pdb.create` | Create PodDisruptionBudget (PDB) object   | `false` |
| `druid.kafka.pdb.maxUnavailable` | Maximum number of simultaneous unavailable pods   | `not set` |
| `druid.kafka.pdb.minAvailable` | Minimum number of available pods   | `not set` |
| `druid.kafka.replicaCount` | Number of kafka nodes   | `1` |
| `druid.kafka.image.pullPolicy` | Kafka image pull policy   | `IfNotPresent` |
| `druid.kafka.resources` | Resource request/limits   | `{} evaluated as a template` |
| `druid.kafka.nodeSelector` | Node labels for pod assignment   | `{} evaluated as a template` |
| `druid.kafka.tolerations` | Pod tolerations for pod assignment   | `{} evaluated as a template` |
| `druid.kafka.affinity` | Affinity for pod assignment   | `{} evaluated as a template` |
| `druid.kafka.additionalLabels` | A list of custom key: value labels | `not set` |
| `druid.kafka.podAnnotations`   | Kafka pod annotations settings.                               | `{} evaluated as a template`                                 |
| `druid.kafka.podSecurityContext` | Kafka pod's security context settings. Overrides global.podSecurityContext settings                                          | `{} evaluated as a template`                                 |
| `druid.kafka.containerSecurityContext` | Kafka container's security context settings. Overrides global.containerSecurityContext settings                              | `{} evaluated as a template`                                 |
| `druid.broker.pdb.create` | Create PodDisruptionBudget (PDB) object   | `false` |
| `druid.broker.pdb.maxUnavailable` | Maximum number of simultaneous unavailable pods   | `not set` |
| `druid.broker.pdb.minAvailable` | Minimum number of available pods   | `not set` |
| `druid.broker.replicaCount` | Number of broker nodes   | `1` |
| `druid.broker.image.pullPolicy` | Broker image pull policy   | `IfNotPresent` |
| `druid.broker.resources` | Resource request/limits   | `{} evaluated as a template` |
| `druid.broker.nodeSelector` | Node labels for pod assignment   | `{} evaluated as a template` |
| `druid.broker.tolerations` | Pod tolerations for pod assignment   | `{} evaluated as a template` |
| `druid.broker.affinity` | Affinity for pod assignment   | `{} evaluated as a template` |
| `druid.broker.additionalLabels` | A list of custom key: value labels | `not set` |
| `druid.broker.podAnnotations`   | Broker pod annotations settings.                               | `{} evaluated as a template`                                 |
| `druid.broker.podSecurityContext` | Broker pod's security context settings. Overrides global.podSecurityContext settings                                          | `{} evaluated as a template`                                 |
| `druid.broker.containerSecurityContext` | Broker container's security context settings. Overrides global.containerSecurityContext settings                              | `{} evaluated as a template`                                 |
| `druid.historical.pdb.create` | Create PodDisruptionBudget (PDB) object   | `false` |
| `druid.historical.pdb.maxUnavailable` | Maximum number of simultaneous unavailable pods   | `not set` |
| `druid.historical.pdb.minAvailable` | Minimum number of available pods   | `not set` |
| `druid.historical.replicaCount` | Number of historical nodes   | `1` |
| `druid.historical.image.pullPolicy` | Historical image pull policy   | `IfNotPresent` |
| `druid.historical.resources` | Resource request/limits   | `{} evaluated as a template` |
| `druid.historical.nodeSelector` | Node labels for pod assignment   | `{} evaluated as a template` |
| `druid.historical.tolerations` | Pod tolerations for pod assignment   | `{} evaluated as a template` |
| `druid.historical.affinity` | Affinity for pod assignment   | `{} evaluated as a template` |
| `druid.historical.additionalLabels` | A list of custom key: value labels | `not set` |
| `druid.historical.podAnnotations`   | Historical pod annotations settings.                               | `{} evaluated as a template`                                 |
| `druid.historical.podSecurityContext` | Historical pod's security context settings. Overrides global.podSecurityContext settings                                          | `{} evaluated as a template`                                 |
| `druid.historical.containerSecurityContext` | Historical container's security context settings. Overrides global.containerSecurityContext settings                              | `{} evaluated as a template`                                 |
| `druid.ingestion.pdb.create` | Create PodDisruptionBudget (PDB) object   | `false` |
| `druid.ingestion.pdb.maxUnavailable` | Maximum number of simultaneous unavailable pods   | `not set` |
| `druid.ingestion.pdb.minAvailable` | Minimum number of available pods   | `not set` |
| `druid.ingestion.replicaCount` | Number of ingestion nodes   | `1` |
| `druid.ingestion.image.pullPolicy` | Ingestion image pull policy   | `IfNotPresent` |
| `druid.ingestion.resources` | Resource request/limits   | `{} evaluated as a template` |
| `druid.ingestion.nodeSelector` | Node labels for pod assignment   | `{} evaluated as a template` |
| `druid.ingestion.tolerations` | Pod tolerations for pod assignment   | `{} evaluated as a template` |
| `druid.ingestion.affinity` | Affinity for pod assignment   | `{} evaluated as a template` |
| `druid.ingestion.additionalLabels` | A list of custom key: value labels | `not set` |
| `druid.ingestion.podAnnotations`   | Ingestion pod annotations settings.                               | `{} evaluated as a template`                                 |
| `druid.ingestion.podSecurityContext` | Ingestion pod's security context settings. Overrides global.podSecurityContext settings                                          | `{} evaluated as a template`                                 |
| `druid.ingestion.containerSecurityContext` | Ingestion container's security context settings. Overrides global.containerSecurityContext settings                              | `{} evaluated as a template`                                 |
| `druid.middlemanager.pdb.create` | Create PodDisruptionBudget (PDB) object   | `false` |
| `druid.middlemanager.pdb.maxUnavailable` | Maximum number of simultaneous unavailable pods   | `not set` |
| `druid.middlemanager.pdb.minAvailable` | Minimum number of available pods   | `not set` |
| `druid.middlemanager.replicaCount` | Number of middle manager nodes   | `1` |
| `druid.middlemanager.image.pullPolicy` | Middle manager image pull policy   | `IfNotPresent` |
| `druid.middlemanager.resources` | Resource request/limits   | `{} evaluated as a template` |
| `druid.middlemanager.nodeSelector` | Node labels for pod assignment   | `{} evaluated as a template` |
| `druid.middlemanager.tolerations` | Pod tolerations for pod assignment   | `{} evaluated as a template` |
| `druid.middlemanager.affinity` | Affinity for pod assignment   | `{} evaluated as a template` |
| `druid.middlemanager.additionalLabels` | A list of custom key: value labels | `not set` |
| `druid.middlemanager.podAnnotations`   | Middle manager's pod annotations settings.                               | `{} evaluated as a template`                                 |
| `druid.middlemanager.podSecurityContext` | Middle manager pod's security context settings. Overrides global.podSecurityContext settings                                          | `{} evaluated as a template`                                 |
| `druid.middlemanager.containerSecurityContext` | Middle manager container's security context settings. Overrides global.containerSecurityContext settings                              | `{} evaluated as a template`                                 |

## Druid Images
The following table lists the configured parameters of the Druid Subchart

| Parameter                   | Description         | Default                  |
|-----------------------------|---------------------|--------------------------|
| `druid.image.zookeeper `    | Zookeeper image     | `zookeeper:5.3.3`        |
| `druid.image.broker`        | Broker image        | `druid:5.3.3`            |
| `druid.image.coordinator`   | Coordinator         | `druid:5.3.3`            |
| `druid.image.middlemanager` | Middlemanager image | `druid:5.3.3`            |
| `druid.image.minio`         | Minio image         | `minio:5.3.3`            |
| `druid.image.historical`    | Historical image    | `druid:5.3.3`            |
| `druid.image.kafka`         | Kafka image         | `kafka:5.3.3`            |
| `druid.image.ingestion`     | Ingestion image     | `ingestion-server:5.3.3` |

## RabbitMQ
The following table lists the configured parameters of the Bitnami RabbitMQ Subchart - https://github.com/bitnami/charts/tree/master/bitnami/rabbitmq

| Parameter                        | Description                               | Default                                                      |
| -----------------------------    | -----------------------------------       | -----------------------------------------------------------  |
| `rabbitmq.enabled`                | Enable this subchart   | `true` |
| `rabbitmq.host`                |  Host - must match fullnameOverride  | `rabbitmq` |
| `rabbitmq.image.tag`    | RabbitMQ image version | `5.3.3` |
| `rabbitmq.fullnameOverride`                | Overrides the name of the subchart   | `rabbitmq` |
| `rabbitmq.pdb.create`    | Create PodDisruptionBudget (PDB) Object   | `false` |
| `rabbitmq.pdb.maxUnavailable   | Maximum number of simultaneous unavailable pods   | `not set` |
| `rabbitmq.pdb.minAvailable   | Minimum number of available pods   | `1` |
| `rabbitmq.serviceAccount.create`                | Enable creation of ServiceAccount for RabbitMQ    | `true` |
| `rabbitmq.serviceAccount.name.`                | Name of the created serviceAccount | Generated using the `rabbitmq.fullname` template |
| `rabbitmq.rbac.create`       | Create and use RBAC resources   | `true` |
| `rabbitmq.persistence.enabled`                | Enable persistence for RabbitMQ   | `true` |
| `rabbitmq.persistence.size`                | PVC Size   | `8Gi` |
| `rabbitmq.persistence.mountPath`            | The path at which RMQ volume will be mounted  | `/bitnami/rabbitmq/mnesia` |
| `rabbitmq.replicaCount`                | Number of replicas. It should maintain a quorum. Preferred for HA is 3 or odd counts.  | `1` |
| `rabbitmq.clustering.forceBoot`                | If RabbitMQ is shut down unintentionally and is stuck in a waiting state set force boot to true  | `false` |
| `rabbitmq.affinity`                | RabbitMQ Affinity Settings | `see values.yaml` |
| `rabbitmq.service.port`                | RabbitMQ Port   | `5672` |
| `rabbitmq.service.extraPorts`                | MySQL Configuration equivalent to my.cnf   | `see values.yaml` |
| `rabbitmq.extraContainerPorts`                | MySQL Configuration equivalent to my.cnf   | `see values.yaml` |
| `rabbitmq.auth.username`                | RabbitMQ username   | `see values.yaml` |
| `rabbitmq.auth.secretName`                | RabbitMQ secret name   | `see values.yaml` |
| `rabbitmq.auth.existingPasswordSecret`                | RabbitMQ existing password secret | `see values.yaml` |
| `rabbitmq.auth.existingErlangSecret`                | RabbitMQ existing erlang secret   | `see values.yaml` |
| `rabbitmq.auth.password`                | RabbitMQ password   | `auto-generated on install - see values.yaml` |
| `rabbitmq.auth.erlangCookie`                | RabbitMQ erlangCookie   | `auto-generated on install - see values.yaml` |
| `rabbitmq.extraPlugins`                | Extra enabled plugins | `see values.yaml` |
| `rabbitmq.loadDefinition.enabled`                | Enable load definitions   | `see values.yaml` |
| `rabbitmq.loadDefinition.existingSecret`                | Existing load definitions secret   | `see values.yaml` |
| `rabbitmq.extraConfiguration`                | Extra configuration   | `see values.yaml` |
| `rabbitmq.statefulsetLabels` | RabbitMQ statefulset labels. Evaluated as a template | `{}` |

## MySQL
The following table lists the configured parameters of the MySQL Subchart - https://github.com/bitnami/charts/tree/master/bitnami/mysql

**_NOTE:- From chart version 2.3.12 dont include 'mysql' string in release-name of `helm install <release-name>` command._**

| Parameter                        | Description                               | Default                                                      |
| -----------------------------    | -----------------------------------       | -----------------------------------------------------------  |
| `mysql.image.tag`                | MySQL Image to use   | `8.4.4-debian-12-r0` |
| `mysql.auth.username`           | MySQL Username   | `admin` |
| `mysql.auth.existingSecret`     | Secret where credentials are stored, see global.databaseSecret   | `database-secret` |
| `mysql.initdbScripts`           | Dictionary of initdb scripts | `see values.yaml` |
| `mysql.primary.configuration`   | MySQL Primary configuration to be injected as ConfigMap	   | `see values.yaml` |
| `mysql.primary.pdb.create`      | Create PodDisruptionBudget (PDB) object   | `false` |
| `mysql.primary.pdb.maxUnavailable` | Maximum number of simultaneous unavailable pods | `not set` |
| `mysql.primary.pdb.minAvailable` | Minimum number of available pods | `1` |
| `mysql.secondary.pdb.create`    | Create PodDisruptionBudget (PDB) object   | `false` |
| `mysql.secondary.pdb.maxUnavailable` | Maximum number of simultaneous unavailable pods | `not set` |
| `mysql.secondary.pdb.minAvailable` | Minimum number of available pods | `not set` |


## Ingress-Nginx

***NOTE:- This is a third-party sub chart which is not supported/maintained by Layer7. Included only for reference/sample.***

The following table lists the configured parameters of the Ingress-Nginx Subchart - https://github.com/kubernetes/ingress-nginx/tree/main/charts/ingress-nginx

This represents minimal configuration of the chart that can be disabled in favor of your own ingress controller in the ingress settings.
IngressClass resources are supported since k8s >= 1.18 and required since k8s >= 1.19

| Parameter                        | Description                               | Default                                                      |
| -----------------------------    | -----------------------------------       | -----------------------------------------------------------  |
| `ingress-nginx.podSecurityPolicy.enabled`                | Tell Nginx to read PSP   | `true` |
| `ingress-nginx.rbac.create`                | Create & use RBAC resources   | `true` |
| `ingress-nginx.controller.publishService.enabled`                | Enable Publish Service   | `true` |
| `ingress-nginx.controller.extraArgs.enable-ssl-passthrough`                | Enable SSL Passthrough   | `true` |
| `ingress-nginx.controller.ingressClassResource.name` | Creation of the IngressClass- with the name | `nginx` |
| `ingress-nginx.controller.ingressClassResource.enabled` | Creating the IngressClass- with the name specified, if this flag is enabled | `true` |
| `ingress-nginx.controller.ingressClassResource.default` | true value will make this the default ingressClass for the cluster | `false` |
| `ingress-nginx.controller.ingressClassResource.controllerValue` | value of the controller that is processing this ingressClass | `k8s.io/ingress-nginx` |

## DNS Configuration
To access API Portal, configure the hostname resolution on your corporate DNS server.
The hostnames must match the values that you enter in your **values.yaml**.

> **IMPORTANT!** If you are migrating from a Docker Swarm deployment, utilize legacy hostnames to ensure continuity of business. For details, see [Migrate from Docker Swarm](../../utils/portal-migration/README.md).

## Resolvable Hostnames

API Portal requires the following hostnames to be resolvable:

| Endpoint | Hostname | Legacy Hostname |
| -------- | -------- | --------------- |
| Default tenant homepage | `apim-<subdomainPrefix>.<domain>` | `apim.<domain>` |
| Ingress SSG | `<subdomainPrefix>-ssg.<domain>` | `ssg.<domain>` |
| Message broker | `<subdomainPrefix>-broker.<domain>` | `broker.<domain>` |
| TSSG enrollment | `<subdomainPrefix>-enroll.<domain>` | `enroll.<domain>` |
| TSSG sync | `<subdomainPrefix>-sync.<domain>` | `sync.<domain>` |
| API analytics | `<subdomainPrefix>-analytics.<domain>` | `analytics.<domain>` |

## Hostname Restrictions
```global.subdomainPrefix``` value observes the following restrictions:
* Lowercase characters and numbers are supported
* Hyphens are allowed
* No other special characters are supported

## Example
Based on the following default values:
```
global:
  subdomainPrefix: dev-portal
portal:
  domain: example.com
```

Resulting hostnames:

| Endpoint | Hostname | Legacy Hostname |
| -------- | -------- | --------------- |
| Default tenant homepage | `apim-dev-portal.example.com` | `apim.example.com` |
| Ingress SSG | `dev-portal-ssg.example.com` | `ssg.example.com` |
| Message broker | `dev-portal-broker.example.com` | `broker.example.com` |
| TSSG enrollment | `dev-portal-enroll.example.com` | `enroll.example.com` |
| TSSG sync | `dev-portal-sync.example.com` | `sync.example.com` |
| API analytics | `dev-portal-analytics.example.com` | `analytics.example.com` |

## Installing in OpenShift
To install Portal >=5.3.3, refer examples/portal/openshift folder.

The below procedure works for portal < v5.3.3

Fetch the OC namespace openshift.io/sa.scc.uid-range values(`<runAsUser-start>/<end>`) and openshift.io/sa.scc.supplemental-groups(`<fsGroupId-start>/<end>`) annotation values.
[Refer to OpenShift documentation](https://docs.openshift.com/dedicated/authentication/managing-security-context-constraints.html#security-context-constraints-pre-allocated-values_configuring-internal-oauth)

Set the following global values in the override-values.yaml and do the helm install.
```
global:
   podSecurityContext:
     fsGroup: <OC namespace starting value of openshift.io/sa.scc.supplemental-groups annotation>
     runAsNonRoot: true
   containerSecurityContext:
     runAsUser: <OC namespace starting value of openshift.io/sa.scc.uid-range annotation>
ingress:
  type:
    kubernetes: false
    openshift: true
```
## Persistent Volumes
With the deployment of API Portal, PersistentVolumeClaims (PVC) are created for components as below:

- RabbitMQ - Used by Portal containers for internal messaging. Containers publish and/or consume messages to and from RabbitMQ.

Analytics components:

- Kafka - Responsible to stream analytics data to druid cluster. Ingestion server streams data to Kafka, which is then ingested into druid processes. If druid containers are not available, Kafka also acts as a message store and retains analytics data up to 6hrs.

- Zookeeper - A critical container in Druid cluster. When not available, it becomes a single point of failure for the entire ingestion pipeline. Kafka and druid clusters both depend on Zookeeper for sync and coordination within their respective clusters.

- Minio - Data store for persisting analytics data. Downtime of Minio leads to data loss as the real time data will not be persisted by ingestion tasks running in druid.

- Historical - Serves data for analytics querying. If this is not available, analytics reports are not loaded in the API Portal UI.


## Troubleshooting

### RabbitMQ does not start

#### The chart was uninstalled and re-installed
RabbitMQ credentials are auto-generated on installation, these are bound to the volume that is created and for peer sync. So with re-install, rabbitmq nodes will not be able to connect to the existing volumes. Perform the following steps for rabbitmq to start.
Note: It is recommended to do a helm upgrade rather than uninstall and install.

1. Remove RabbitMQ Replicas (scale to 0)
```
$ kubectl get statefulset rabbitmq - take note of the total replicas, will likely be 1 or 3

$ kubectl scale statefulset rabbitmq --replicas=0

$ kubectl get pvc | grep rabbitmq
```

2. For each data-rabbitmq-0|1|2 is returned
```
$ kubectl delete pvc data-rabbitmq-0|1|2
```

3. Add RabbitMQ Replicas (scale to 1|3)
```
$ kubectl scale statefulset rabbitmq --replicas=1|3
```
After the rabbitmq is running, make a note of its credentials as specified above in [Install Chart section - Credentials for Rabbitmq](#install-the-chart)

#### Your Kubernetes nodes failed or RabbitMQ crashed.
If the RabbitMQ cluster is stopped or removed out of order, there is a chance that it will not be restored correctly. Or if sync between rabbitmq peers doesnot happen or set of rabbitmq nodes can never be brought online, then use the 'force boot' option.

1. Set force boot to true

  - In your <my-values.yaml> file, set ```rabbitmq.clustering.forceBoot:true```

2. Upgrade the chart:
```
$ helm upgrade <release-name> --set-file <values-from-install> --set <values-from-install> -f <my-values.yaml> layer7/portal
```

### Helm UPGRADE FAILED: cannot patch "db-upgrade" and "rbac-upgrade"
If helm upgrade of the portal fails with error "Error: UPGRADE FAILED: cannot patch 'db-upgrade'", it is becasue of the limitation in kubernetes where a job can not be updated.

1. Run the following command to list the jobs in the namespace:-
```
$ kubectl get jobs -n  <nameSpace>
```

2. Run the following command to delete jobs:
```
kubectl delete job db-upgrade -n <nameSpace>
kubectl delete job rbac-upgrade -n <nameSpace>
```

### MySQL container in unhealthy state

#### The chart was uninstalled and re-installed
MySQL container health check is failing as it is using credentials that were auto-generated during current installation to access the database created during earlier installation. We have to recreate database with new credentials by deleting old volumes. This process causes loss of old data.

1. Run the following commands to remove MySQL Replicas (scale to 0):
```
$ kubectl get statefulset <release-name>-mysql

$ kubectl scale statefulset <release-name>-mysql --replicas=0

$ kubectl get pvc | grep data-<release-name>-mysql
```

2. For each data-\<release-name\>-mysql-\<number\> is returned, run the following command:
```
$ kubectl delete pvc data-<release-name>-mysql-<number>
```

3. Run the following command to restore MySQL Replicas
```
$ kubectl scale statefulset <release-name>-mysql --replicas=<replica_count>
```

## License
Copyright (c) 2025 CA, A Broadcom Company. All rights reserved.

This software may be modified and distributed under the terms of the MIT license. See the [LICENSE](https://github.com/CAAPIM/apim-charts/blob/stable/LICENSE) file for details.
