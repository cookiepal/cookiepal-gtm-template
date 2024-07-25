___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "CookiePal",
  "categories": [
    "TAG_MANAGEMENT",
    "PERSONALIZATION"
  ],
  "brand": {
    "id": "github.com_cookiepal",
    "displayName": "cookiepal"
  },
  "description": "",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "websiteId",
    "displayName": "Website Id",
    "simpleValueType": true,
    "help": "The website id of your cookiepal account.",
    "notSetText": "This field is required.",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "valueHint": "Your website id"
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// Require the necessary APIs
const logToConsole = require('logToConsole');
const injectScript = require('injectScript');
const queryPermission = require('queryPermission');

// Get website id from user input
const websiteId = data.websiteId;

logToConsole('Website is',websiteId);

// If the script loaded successfully, log a message and signal success
const onSuccess = () => {
  logToConsole('Script loaded successfully.');
  data.gtmOnSuccess();
};

// If the script fails to load, log a message and signal failure
const onFailure = () => {
  logToConsole('Script load failed.');
  data.gtmOnFailure();
};

// If the URL input by the user matches the permissions set for the template,
// inject the script with the onSuccess and onFailure methods as callbacks
const url = 'https://cdn.cookiepal.io/client_data/' + websiteId + '/script.js';
if (queryPermission('inject_script', url)) {
  injectScript(url, onSuccess, onFailure);
  return;
}

logToConsole('Script load failed due to permissions mismatch.');
data.gtmOnFailure();


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://cdn.cookiepal.io/client_data/*"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 29/06/2022, 23:29:56


