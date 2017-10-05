# response = HTTParty.get('http://api.stackexchange.com/2.2/questions?site=stackoverflow')

# puts response.body, response.code, response.message, response.header.inspect

# Or wrap things up in your own class
class PetfinderAdapter

  include HTTParty
  base_uri 'api.petfinder.com'
  # For the Giphy Adapter class, make the endpoint
  # equal to whatever is called with

  def initialize
    @api_key = ENV['PETFINDER_API_KEY']
  end

  # def search(search_string)
  #   response = self.class.get("/v1/gifs/search",
  #                  { query:
  #                    {
  #                      q: search_string,
  #                      api_key: @api_key
  #                    }
  #                  })
  #
  #   response["data"].map { |result| result["images"]["fixed_height"]["url"] }
  # end

  def search
    response = self.class.get("/pet.getRandom?key=#{@api_key}&animal=dog&format=json&output=full").response.read_body
    JSON.parse(response)
  end

end
