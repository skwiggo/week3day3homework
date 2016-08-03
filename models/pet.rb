require('pg')
require_relative('../db/sql_runner')

class Pet

  attr_accessor(:id, :name, :type, :pet_id)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @type = options['type']
    @pet_id = options['pet_id'].to_i
  end

  def save()
    sql = "INSERT INTO pets (name, type, pet_id) VALUES ('#{@name}', '#{type}', #{@pet_id}) RETURNING *;"
    pets = SqlRunner.run(sql).first
    @id = pets['id'].to_i
  end

  def stores()
    sql = "SELECT * FROM stores WHERE stores.id = '#{@pet_id}'"
    pet = SqlRunner.run(sql).first
    Pet.new(pet)
  end

  def edit_pets()
    sql = "UPDATE pets SET 
    name ='#{@name}'
    WHERE id = #{@id};"
    pet = SqlRunner.run(sql).first
    return pet
  end



   
end
