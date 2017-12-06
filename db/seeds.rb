# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cadastrando o Motorista Padrão..."

Driver.create!(name:"Tileco",
                birth:"16/01/1994",
                cpf:"123.321.123-32",
                car_model:"Accord",
                status:"Ativo",
                sex:"Masculino"
            )

puts "Motorista cadastrado. [OK]"

puts "Cadastrando o Passageiro Padrão..."

Passenger.create!(name:"Pedroca",
                birth:"16/01/1994",
                cpf:"123.321.123-32",
                sex:"Masculino"
            )

puts "Passageiro cadastrado. [OK]"


puts "Cadastrando Corrida"
Driver.all.each do |d|
    Passenger.all.each do |p|
        Race.create!(driver: d, passenger: p, value: "100")
    end
end
puts "Corrida criada [ok]"