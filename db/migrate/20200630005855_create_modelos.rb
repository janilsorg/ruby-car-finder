class CreateModelos < ActiveRecord::Migration[6.0]
  def change
    create_table :modelos do |t|
      t.string :nome_modelo

      t.timestamps
    end
  end
end
