#!/bin/sh

if [ ! -f $WERCKER_CACHE_DIR/GeoLiteCity.dat ]; then
  cd /tmp
  curl -O http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz
  gunzip GeoLiteCity.dat.gz
  cp GeoLiteCity.dat.gz $WERCKER_CACHE_DIR
fi
sudo mkdir -p /usr/share/GeoIP
sudo cp $WERCKER_CACHE_DIR/GeoLiteCity.dat /usr/share/GeoIP