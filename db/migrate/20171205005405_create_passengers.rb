class CreatePassengers < ActiveRecord::Migration[5.0]
  def change
    create_table :passengers do |t|
      t.string :name
      t.date :birth
      t.text :cpf
      t.string :sex
      
      t.timestamps
    end
  end
end
