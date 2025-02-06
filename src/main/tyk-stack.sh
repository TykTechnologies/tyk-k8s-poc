source src/main/storage/main.sh;

tykReleaseName="tyk-stack";
tykReleaseVersion="2.2.0";

args=(
  --set "global.license.dashboard=$LICENSE" \
  --set "global.license.operator=$OPERATOR_LICENSE" \
  --set "global.adminUser.email=$TYK_USERNAME" \
  --set "global.adminUser.password=$TYK_PASSWORD" \
  --set "tyk-gateway.gateway.image.repository=tykio/tyk-gateway" \
  --set "tyk-gateway.gateway.image.tag=$GATEWAY_VERSION" \
  --set "tyk-gateway.gateway.service.port=8080" \
  --set "tyk-dashboard.dashboard.image.tag=$DASHBOARD_VERSION" \
  --set "tyk-pump.pump.image.tag=$PUMP_VERSION" \
  --set "tyk-pump.pump.image.repository=tykio/tyk-pump-docker-pub" \
  --set "tyk-dashboard.tib.enabled=true" \
);

addService "dashboard-svc-$tykReleaseName-tyk-dashboard";
addService "gateway-svc-$tykReleaseName-tyk-gateway";
checkTykRelease;

addDeploymentArgs "${args[@]}";
addDeploymentArgs "${gatewaySecurityContextArgs[@]}";
addDeploymentArgs "${tykSecurityContextArgs[@]}";
addDeploymentArgs "${extraEnvs[@]}";
addDeploymentArgs "${loadbalancerArgs[@]}";
addDeploymentArgs "${ingressArgs[@]}";
upgradeTyk;

addSummary "\tTyk Stack deployed\n \
\tDashboard username: $TYK_USERNAME\n \
\tDashboard password: $TYK_PASSWORD";
