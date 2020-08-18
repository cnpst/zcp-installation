. env.properties

# Install gitea
# Chart revision for jenkins : https://github.com/helm/charts/tree/605d3d441e6515fcbbf8a69bdc69794d90bbfd5c/stable/jenkins
helm3 install zcp-git gitea-1.3.3.tgz \
-f values-eks-117.yaml \
--namespace ${TARGET_NAMESPACE} \
--set ingress.annotations."kubernetes\.io/ingress\.class"=${GITEA_INGRESS_CONTROLLER} \
--set ingress.hostname=${GITEA_INGRESS_HOSTS} \
--set ingress.tls[0].hosts[0]=${GITEA_INGRESS_TLS_HOSTS} \
--set ingress.tls[0].secretName=${DOMAIN_SECRET_NAME} \
--set persistence.storageClass=efs-zcp \
--set mariadb.master.persistence.storageClass=efs-zcp \