# Get the input information
#!/bin/bash

SPANISH=Hola
echo "Please enter your ADM Client ID and Client Secret"
read CLIENTID CLIENTSECRET

TOKEN=$(curl -X POST --Header "content-type: application/x-www-form-urlencoded" -d "grant_type=client_credentials&client_id=$CLIENTID&client_secret=$CLIENTSECRET&scope=http://api.microsofttranslator.com" https://datamarket.accesscontrol.windows.net/v2/OAuth2-13 | grep -Po '"access_token":.*?[^\\]",' | cut -d '"' -f4)

TRANSLATION=$(curl -H "Authorization: Bearer $TOKEN" "http://api.microsofttranslator.com/v2/Http.svc/Translate?text=$SPANISH&from=es&to=en" | grep -o '>.*<' | grep -o '[A-Za-z]*')

echo $TRANSLATION


