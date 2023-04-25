# Cloudflare Dynamic DNS Updater

This is a Bash script that updates the DNS record for a domain hosted on Cloudflare with the current IPv4 address of the machine the script is running on. This script uses the Cloudflare API to perform the DNS update.

## Prerequisites

- Bash shell
- `curl` command-line utility
- `jq` command-line utility
- Cloudflare API key with the `Zone.Zone:Read` and `Zone.DNS:Edit` permissions

## Installation

1. Clone this repository or copy the `cloudflare-ddns.sh` script to your machine.
2. Make the script executable by running `chmod +x cloudflare-ddns.sh`.
3. Edit the `cloudflare-ddns.sh` script and replace the following variables with your own values:
   - `domain`: the name of the domain to update
   - `zoneId`: the zone IDs corresponding to the domain name
   - `recordId`: the record ID corresponding to the domain name
   - `apiKey`: your Cloudflare API key
4. Test the script by running `./cloudflare-ddns.sh`. This should update the DNS record for the specified domain name with the current IP address. You can check if the update was successful by logging into your Cloudflare account and checking the DNS records for the domain.

## Usage

To update the DNS record for a domain, simply run the `cloudflare-ddns.sh` script. The script will automatically query the URL `https://ifconfig.me/all.json` to obtain the current IP address of the machine and update the DNS record for the domain with the new IP address.

By default, the script will run once and update the domain specified in the `domain` variable. If you want to run the script on a regular basis, you can use a cron job to schedule the script to run at specific intervals.

For example, to run the script every 3 minutes, add the following line to your crontab file:

    */3 * * * * /path/to/cloudflare-ddns.sh

This will run the `cloudflare-ddns.sh` script every 3 minutes and update the DNS records for the domain specified in the script.

## Troubleshooting

If the DNS update fails, make sure to check the following:

- The Cloudflare API key is valid and has the `Zone.Zone:Read` and `Zone.DNS:Edit` permissions.
- The domain name, zone ID, and record ID in the script are correct.
- The machine running the script has a valid IPv4 address and can access the internet.
- The `curl` and `jq` utilities are installed and working correctly on the machine running the script.

## License

This script is licensed under the MIT License. See the LICENSE file for details.
