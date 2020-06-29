class CreateCarros < ActiveRecord::Migration[6.0]
  def change
    create_table :carros do |t|
      t.string :nome
      t.string :ano
      t.references :marca, null: false, foreign_key: true

      t.timestamps
    end
  end
end
