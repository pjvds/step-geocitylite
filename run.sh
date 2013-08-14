if [ ! -f $WERCKER_CACHE_DIR/GeoLiteCity.dat ]; then
  debug 'GeoLiteCity.dat not found in cache directory, will download it'

  cd /tmp
  rm -f GeoLiteCity*
  curl -O http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz || fail 'unable to download GeoLiteCitry.data.gz'
  gunzip GeoLiteCity.dat.gz
  cp GeoLiteCity.dat $WERCKER_CACHE_DIR

  debug 'GeoLiteCity.dat added to cache successfully'
else
  debug 'GeoLiteCity.dat found in cache directory'
fi

sudo mkdir -p /usr/share/GeoIP
sudo cp $WERCKER_CACHE_DIR/GeoLiteCity.dat /usr/share/GeoIP

success 'GeoLiteCity.dat installed into /usr/share/GeoIP'
