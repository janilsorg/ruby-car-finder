class CreateCorpos < ActiveRecord::Migration[6.0]
  def change
    create_table :corpos do |t|
      t.string :body_type

      t.timestamps
    end
  end
end
