post '/dog' do
  @results = PetfinderAdapter.new.search
  ap @results
  # @results = GiphyAdapter.new.search(@search_string)
  # erb :"/giphy/results.html"
  erb :"/index"
end
