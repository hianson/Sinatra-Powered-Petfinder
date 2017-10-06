post '/dog' do
  @results = PetfinderAdapter.new.search
  p @results

  # if @results.any?
    @id = @results["id"]["$t"]
    @name = @results["name"]["$t"] if @results["name"]
    @sex = @results["sex"]["$t"] if @results["sex"]
    @age = @results["age"]["$t"] if @results["age"]
    @size = @results["size"]["$t"] if @results["size"]
    @description = @results["description"]["$t"] if @results["description"]

    #contact info
    @email = @results["contact"]["email"]["$t"]
    @city = @results["contact"]["city"]["$t"]
    @state = @results["contact"]["state"]["$t"]
    @zip = @results["contact"]["zip"]["$t"]

    # photo
    @main_photo = @results["media"]["photos"]["photo"][2]["$t"]

    if @results["media"] == nil
      @main_photo = "https://www.petfinder.com/wp-content/themes/petfinder2013/img/search/no-photo-profile.png"
    end

    # find breeds
    @breed = @results["breeds"]["breed"]
    temp_breeds = []
    if @breed.count > 1
      @breed.map {|hash| temp_breeds << hash["$t"]}
      @breed = temp_breeds.join(", ")
    else
      @breed = @results["breeds"]["breed"]["$t"]
    end

  # else
  #   @name = "ERROR"
  #   @sex = "ERROR"
  #   @age = "ERROR"
  #   @size = "ERROR"
  #   @breed = "ERROR"
  #   @description = "ERROR"
  #   "*" * 50
  #   @photos = "ERROR"
  #   "*" * 50
  #   @contact = "ERROR"
  #
  #   @main_photo = "ERROR"
  # end
  # phone, state, address2, address1, city, zip

  # binding.pry
  erb :"/show"
end
