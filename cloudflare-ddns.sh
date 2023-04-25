#!/bin/bash

# Replace with your own values
domain="example.com"
zoneId="your_zone_id"
recordId="your_record_id"
apiKey="your_api_key"

# Query the URL and extract the IP address from the JSON response
ip=$(curl -s https://ifconfig.me/all.json | jq -r '.ip_addr')

if [ -z "$ip" ]; then
  echo "Error: could not find IP address in JSON response"
  exit 1
fi

# Update the DNS record with the new IP address
update=$(curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/$zoneId/dns_records/$recordId" \
         -H "Authorization: Bearer $apiKey" \
         -H "Content-Type: application/json" \
         --data "{\"type\":\"A\",\"name\":\"$domain\",\"content\":\"$ip\"}")

if [ "$(echo "$update" | jq -r '.success')" == "true" ]; then
  echo "DNS record updated successfully to $ip"
else
  echo "Error: DNS record update failed"
  exit 1
fi
