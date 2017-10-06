post '/dog' do
  @results = PetfinderAdapter.new.search
  p @results
  if @results.any?
    @name = @results["name"]["$t"] if @results["name"]
    @sex = @results["sex"]["$t"] if @results["sex"]
    @age = @results["age"]["$t"] if @results["age"]
    @size = @results["size"]["$t"] if @results["size"]
    @breed = @results["breeds"]["breed"]["$t"] if @results["breeds"]["breed"]
    @description = @results["description"]["$t"] if @results["description"]
    "*" * 50
    # @photos = @results["media"]["photos"]["photo"]
    "*" * 50
    # @contact = @results["contact"]

    # @main_photo = @photos[2]["$t"]

    @location = @results["name"][""]

    @main_photo = @results["media"]["photos"]["photo"][2]["$t"]

  else
    @name = "ERROR"
    @sex = "ERROR"
    @age = "ERROR"
    @size = "ERROR"
    @breed = "ERROR"
    @description = "ERROR"
    "*" * 50
    @photos = "ERROR"
    "*" * 50
    @contact = "ERROR"

    @main_photo = "ERROR"
  end
  # phone, state, address2, address1, city, zip

  # binding.pry
  erb :"/show"
end
