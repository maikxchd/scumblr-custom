#     Requires a pastebin pro account with IP of Scumblr server whitelisted
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

require 'uri'
require 'net/http'
require 'json'

class SearchProvider::Pastebin < SearchProvider::Provider
  def self.provider_name
    "Pastebin Search"
  end

  def self.options
    {
      :results=>{name: "Max search",
         description: "Specify the number of recent Pastebin paste's to search, limit: 500 | blank: 50",
         required: false
         }
    }

  end

  def self.description
    "Search Pastebin for recent posts.
    Include many searchterms in 'Query'.
    Seperate each searchterm by ';' w/o quotes"
  end

  def initialize(query, options={})
    super
        @options[:results] = @options[:results].blank? ? 50 : @options[:results]
  end

  def run
    if @query.include?(";")
        querylist = @query.split("; ")
    else
        querylist = []
        querylist.push(@query)
    end

    url = URI.escape('https://pastebin.com/api_scraping.php?limit=' + @options[:results].to_s)

    response = Net::HTTP.get_response(URI(url))
    results = []
    if response.code == "200"

      search_results = JSON.parse(response.body)
      search_results.each do |a| # this finds itmes in the array
          paste_page = HTTParty.get(a["scrape_url"])
          querylist.each do |searchterm|
              if paste_page.body[searchterm]
                  results <<
                  {
                      :title => a['title'],
                      :url => a['scrape_url'],
                      :domain => "pastebin.com",
                      :tags => searchterm
                  }
              end
          end
      end
    else
        Rails.logger.error "Bad response received from Pastebin. Response code: #{response.code}.\nResponse: #{response.try(:body)}"
    end
    return results
  end
end
