class CreateDrivers < ActiveRecord::Migration[5.0]
  def change
    create_table :drivers do |t|
      t.string :name
      t.date :birth
      t.text :cpf
      t.string :car_model
      t.string :status
      t.string :sex

      t.timestamps
    end
  end
end
