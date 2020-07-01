class CreateCors < ActiveRecord::Migration[6.0]
  def change
    create_table :cors do |t|
      t.string :color_name

      t.timestamps
    end
  end
end
