#!/usr/bin/env bash

source "../config.sh"
source "../jwt.sh"

curl -X POST https://api.nexmo.com/v0.1/messages \
  -H 'Authorization: Bearer '$JWT \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -d $'{
    "from": { "type": "whatsapp", "number": '$WHATSAPP_NUMBER' },
    "to": { "type": "whatsapp", "number": '$TO_NUMBER' },
    "message": {
      "content": {
        "type": "file",
        "file": { 
          "url": '$FILE_URL',
          "caption": '$FILE_CAPTION'
        }
      }
    }
  }'
