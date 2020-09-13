cd /mybin

chmod +x cgi
chmod +x v2ctl

sed -i "s/77777/$PORT/g" config.json
sed -i "s/your_own_uuid/$UUID/g" config.json

./cgi &
envsubst '\$PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'
