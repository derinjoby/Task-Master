# app/services/space_news_service.rb
class SpaceNewsService
    include HTTParty
    base_uri 'https://api.spaceflightnewsapi.net/v4'
  
    def self.fetch_articles
      response = get('/articles?limit=5')  # Adjust your endpoint as needed
      response.parsed_response
    end
  end
  
