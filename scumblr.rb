#     Copyright 2016 Netflix, Inc.
#
#     Licensed under the Apache License, Version 2.0 (the "License");
#     you may not use this file except in compliance with the License.
#     You may obtain a copy of the License at
#
#         http://www.apache.org/licenses/LICENSE-2.0
#
#     Unless required by applicable law or agreed to in writing, software
#     distributed under the License is distributed on an "AS IS" BASIS,
#     WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#     See the License for the specific language governing permissions and
#     limitations under the License.

Scumblr::Application.configure do

  # Task configurations
  # The configuration settings below are used to setup credentials, keys and
  # other values needed for tasks. By default the values will be retrieve
  # from environment variables as configured below. This file can be modified
  # to include these values inline if desired.

  # Notification emails
  config.email_source_address = ""

  # Sketchy
  config.sketchy_url = "http://127.0.0.1:8000/api/v1.0/capture"
  config.sketchy_use_ssl = "false" ? false : true # Does sketchy use ssl?
  config.sketchy_verify_ssl = "false" ? false : true # Should scumblr verify sketchy's cert
  #config.sketchy_tag_status_code = ENV["sketchy_tag_status_code"] # Add a tag indicating last status code sketchy received
  #config.sketchy_access_token = ENV["sketchy_access_token"]

  # Google
  config.google_application_name = "scumblr-google"
  config.google_application_version = "1.0"
  config.google_developer_key = ""
  config.google_cx = ""

  # Google Onion Search
  config.google_onion_application_name = "scumblr-onion"
  config.google_onion_application_version = "1.0"
  config.google_onion_developer_key = ""
  config.google_onion_cx = ""

  # YouTube
  config.youtube_application_name = "youtube"
  config.youtube_application_version = "v3"
  config.youtube_developer_key = ""

  # eBay
  #config.ebay_access_key = ENV["ebay_access_key"]

  # Facebook
  config.facebook_app_id = ""
  config.facebook_app_secret = ""

  # Twitter
  config.twitter_consumer_key = ""
  config.twitter_consumer_secret = ""
  config.twitter_access_token = ""
  config.twitter_access_token_secret = ""

  # Github
  #config.github_oauth_token = ENV["github_oauth_token"]

  #OpenGrok
  #config.opengrok_url = ENV["opengrok_url"]

  #temp directory for static code analysis
  config.downloads_tmp_dir = "/tmp/"

end
