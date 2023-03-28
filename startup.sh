# !/bin/bash
set -ex
# To start the cron daemon
crond
# Copy logrotate config
cp /tmp/app_logrotate.conf /etc/logrotate.d/app
cp /tmp/nginx_logrotate.conf /etc/logrotate.d/nginx
sed -i "s/#APP_NAME/$appName/g" /etc/logrotate.d/app /etc/logrotate.d/nginx /tmp/beaver.conf
sed -i "s/#S3_BUCKET/$S3_LOG_BUCKET/g" /etc/logrotate.d/app /etc/logrotate.d/nginx
# set robots url
echo $robotsurl
sed -i "s%ROBOTS_URL%$robotsurl%g" /etc/nginx/nginx.conf
# Reverse proxy caching
#sed -i "s/#API_HOST/$apiHost/g" /etc/nginx/sites-available/nginx_cache
#ln -nfs /etc/nginx/sites-available/nginx_cache /etc/nginx/sites-enabled/nginx_cache
if [ -f "beaver/beaver.conf" ] && [ $(grep -c "$appName-Section" beaver/beaver.conf) -eq 0 ]
 then
  cat /tmp/beaver.conf >> beaver/beaver.conf
 fi
# Add secrets from etcd
# declare -a etcdConfigKeys=($(curl -XGET "$etcdHost:2379/v2/keys/$appName/?recursive=true" | jq -r '.node.nodes[].key'))
# for config in "${etcdConfigKeys[@]}"
# do
#   configPath=${config#"/$appName/"}
#   curl -s -XGET "$etcdHost:2379/v2/keys/$appName/$configPath?recursive=true" | jq -r '.node.value'> "$configPath.js"
# done
FILEPATH=/etc/rudderstack/
aws s3 cp ${WORKSPACECONFIG_S3_URI} ${FILEPATH}/workspaceConfig.json
# goreman start
# CMD ["/rudder-server"]