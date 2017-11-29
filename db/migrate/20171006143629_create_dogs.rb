class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string  :petfinder_id
      t.string  :name
      t.string  :sex
      t.string  :age
      t.string  :size
      t.string  :description

      t.string  :email
      t.string  :city
      t.string  :state
      t.string  :zip

      t.string  :photos
      t.string  :breeds
    end
  end
end
