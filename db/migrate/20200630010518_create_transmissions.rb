class CreateTransmissions < ActiveRecord::Migration[6.0]
  def change
    create_table :transmissions do |t|
      t.string :transmission_type

      t.timestamps
    end
  end
end
