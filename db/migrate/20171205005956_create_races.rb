class CreateRaces < ActiveRecord::Migration[5.0]
  def change
    create_table :races do |t|
      t.decimal :value
      t.references :driver, foreign_key: true
      t.references :passenger, foreign_key: true

      t.timestamps
    end
  end
end
