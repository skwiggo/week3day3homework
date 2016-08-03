require('pg')
require_relative('../db/sql_runner')

class Store

  attr_reader(:id, :name, :address, :stock)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @address = options['address']
    @stock = options['stock']
  end

  def self.all()
    sql = "SELECT * FROM stores;"
    stores = SqlRunner.run(sql)
    result = stores.map {|store| Store.new(store)}
    return result
  end

  def self.find(id)
    sql = "SELECT * from stores where id = #{id}"
    store = SqlRunner.run(sql).first
    return Store.new(store)
  end

  def save()
    sql = "INSERT INTO stores (name, address, stock) VALUES ('#{@name}', '#{@address}', '#{@stock}') RETURNING *;"
    store = SqlRunner.run(sql).first
    @id = store['id'].to_i
  end

  def pets()
    sql = "SELECT * FROM pets WHERE pet_id = #{@id};"
    pets = SqlRunner.run(sql)
    result = pets.map {|pet| Pet.new(pet)}
    return result
  end

end