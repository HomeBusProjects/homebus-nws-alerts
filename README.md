# HomeBus NWS Alerts

This is a simple HomeBus data source which collects weather conditions from OpenWeatherMap.

## Usage

On its first run, `homebus-nws-alerts` needs to know how to find the HomeBus provisioning server.

```
bundle exec homebus-nws-alerts -b homebus-server-IP-or-domain-name -P homebus-server-port
```

The port will usually be 80 (its default value).

Once it's provisioned it stores its provisioning information in `.env.provisioning`.

`homebus-nws-alerts` also needs to know:


```
homebus-nws-alerts 
```

## Find Your Zone

Go to the "State (Zone List | County List)" at https://alerts.weather.gov, find your state, click through to the "Zone List" and then find your zone in the list.

For instance, the "Greater Portland Metro area" is ORZ006.

### NWS Weather API

https://www.weather.gov/documentation/services-web-api



# dev links

https://api.weather.gov/alerts/active?area=OR

https://www.nws.noaa.gov/directives/sym/pd01017002curr.pdf

https://www.weather.gov/pimar/PubZone

https://www.weather.gov/media/pimar/PubZone/or_zone.pdf

