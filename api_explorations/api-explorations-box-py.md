---
title: "api-explorations-box-py"
author: "Jesse Lingeman"
date: "2019-11-04 11:29:41"
output:
  html_document:
    keep_md: true
    theme: lumen
    toc: true
    toc_depth: 4
    toc_float: true
    code_folding: show
---



## Purpose

This document explores the utility of using the Box.com API for file management for the [Python SDK](https://github.com/box/box-python-sdk).

## Set-up

Install the ``boxsdk[jwt]`` package from pip:
```bash
pip install boxsdk[jwt]
```

## Setting up Box for access by `boxsdk` using OAuth2 w/ JWT

1. Create an application on [developer.box.com](https://developer.box.com) as a Custom App
1. Set up the application to use OAuth2 with JWT integration
1. In the app configuration interface, generate a new public/private key (you may need to enable 2 factor auth). This will download the completed json file. Rename this file to config.json and store it somewhere that the script can access.
1. Then copy the client_id from the App configuration page and go to account settings by clicking on the face icon in the upper right corner
1. Then go to "Admin Console" on the left menu
1. Then on the left select "Enterprise Settings" and select the "Apps" tab at the top
1. Scroll down and under "Custom Applications" click "Authorize New App" and paste in the copy client_id when asked for an API Key.
1. Now you can use the api to log into your app.

### Authenticating with Box using `boxsdk` using OAuth2 w/ JWT

```python
import boxsdk as bx
config = bx.JWTAuth.from_settings_file("config.json")
client = bx.Client(config)
```

You can then use the client object to access your Box folder.

## Setting up Box for access by `boxsdk` using OAuth2 without JWT

Due to security restrictions on NYU's box, we cannot associate a 3rd party app with NYU's
enterprise account. However, we can use a personal Box account to access a shared folder that
is on NYU's Box, and interface an app into that way. In order to do that,
we need to give the app permissions to use the personal account, and we do that
using traditional OAuth2.

Note: the following code is clunky and requires user interaction: we can
automate this code by spinning up a quick flask redirect handler.

```python
import boxsdk as bx
import keyring
import logging as log

class Box:
    def __init__(self, client_id):

        # config = JWTAuth.from_settings_file("config.json")

        client_id = "GET FROM BOX DEV MENU"
        client_secret = "GET FROM BOX DEV MENU"
        redirect_url = "http://localhost"
        oauth = bx.OAuth2(
            client_id = client_id,
            client_secret = client_secret,
            store_tokens = self.store_tokens
        )
        auth_url, csrf_token = oauth.get_authorization_url('http://localhost')
        print(auth_url)
```

Then we have to go to that auth_url in a web browser, grant permissions, and be
redirected to the localhost website (that doesn't exist).

In the parameters of the URL though that you get redirected to, there is a code
that is generated. You can find this in the URL with "?code=xxxxxxxxxxxxxxx"
Copy and paste this code into the following code that continues the code from
above:

```python
        access_token, refresh_token = oauth.authenticate('CODE GOES HERE')
        print(access_token, refresh_token)
```

This will generate an access_token and a refresh_token. The access_token is good
for several hours, while the refresh_token is good for 2 weeks. We can also use
these tokens to generate new tokens. But now that we have these tokens, we can
access files in the box.

```python
        # Get the root folder
        oauth = bx.OAuth2(
            client_id = client_id,
            client_secret = client_secret,
            access_token = access_token,
            refresh_token = refresh_token
        )
        # Authenticate using our new tokens
        client = bx.Client(oauth)

        # Get the items in the Box root directory
        items = client.root_folder().get_items()

        # Loop over the items in the Box root directory, printing the files
        # but also searching for a specific foldername
        for i in items:
            print("{0} {1} is named {2}".format(i.type.capitalize(), i.id, i.name))
            if i.name == "FOLDER_TO_FIND_IN_ROOT":
                test_folder = client.folder(i.id)
                new_file = test_folder.upload("file_to_upload.jpg")
                print('File "{0}" uploaded to Box with file ID {1}'.format(new_file.name, new_file.id))


    # From: https://stackoverflow.com/questions/29595255/working-with-the-box-com-sdk-for-python
    @classmethod
    def read_tokens(cls):
        """Reads authorisation tokens from keyring"""
        # Use keyring to read the tokens
        auth_token = keyring.get_password("Box_Auth", "mybox@box.com")
        refresh_token = keyring.get_password("Box_Refresh", "mybox@box.com")
        return auth_token, refresh_token

    def store_tokens(self, access_token, refresh_token):
        """Callback function when Box SDK refreshes tokens"""
        # Use keyring to store the tokens
        keyring.set_password("Box_Auth", "mybox@box.com", access_token)
        keyring.set_password("Box_Refresh", "mybox@box.com", refresh_token)
```
