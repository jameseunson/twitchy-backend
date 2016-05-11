# twitchy-backend
Twitchy backend that enables OAuth authentication with Twitch.tv

Inspired by method described in http://stephenradford.me/oauth-login-on-tvos/

This app is deployed at http://twitchy.jeon.com.au/code and is a companion to https://github.com/jameseunson/twitchy that enables users to login to their Twitch.tv account via OAuth. Because tvOS cannot display a webview, a third-party website is required to enable OAuth logins.

More information about the Twitchy project is available here: http://jeon.com.au/twitchy

Note, if you wish to deploy this web application yourself, you will need to include two values in the production section of your secrets.yml file: twitch_client_id and twitch_client_secret, which correspond to the Client ID and secret received when you register an OAuth application with Twitch.tv. Application registrations can be performed here https://www.twitch.tv/kraken/oauth2/clients/new

You will also need to ensure you include your own redirect_uri in the process_code method of IndexController, and make sure it matches the redirect url you provided to Twitch when registering your application.

![Twitchy for tvOS by James Eunson](https://i.imgur.com/RU8aIEc.jpg "Twitchy for tvOS by James Eunson")

![Twitchy for tvOS by James Eunson](https://i.imgur.com/mYPMKq5.jpg "Twitchy for tvOS by James Eunson")
