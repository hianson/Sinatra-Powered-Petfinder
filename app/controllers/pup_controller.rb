post '/dog' do
  @results = PetfinderAdapter.new.search
  # ap @results
  p @name = @results["petfinder"]["pet"]["name"]
  p @sex = @results["petfinder"]["pet"]["sex"]
  p @age = @results["petfinder"]["pet"]["age"]
  p @size = @results["petfinder"]["pet"]["size"]
  p @breed = @results["petfinder"]["pet"]["breeds"]["breed"]
  p @description = @results["petfinder"]["pet"]["description"]
  p @photos = @results["petfinder"]["pet"]["media"]["photos"]["photo"]

  p @contact = @results["petfinder"]["pet"]["contact"]
  # phone, state, address2, address1, city, zip

  binding.pry
  erb :"/index"
end
