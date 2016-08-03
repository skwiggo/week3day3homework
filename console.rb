require_relative('./models/pet')
require_relative('./models/store')

require('pry-byebug')

store1 = Store.new({'name' => 'Mr Magoriums Wonder Pet Emporium', 'address' => '109 Regent Road', 'stock' => 'stupid'})
store1.save()

pet1 = Pet.new({'name' => 'Zelda', 'type' => 'domestic shorthaired - cat', 'pet_id' => store1.id})
pet2 = Pet.new({'name' => 'Horace', 'type' => 'pit bull terrier - dog', 'pet_id' => store1.id})
pet1.save()
pet2.save()

binding.pry
nil
