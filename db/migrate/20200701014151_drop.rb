class Drop < ActiveRecord::Migration[6.0]
  def change
    drop_table :modelos_copy
  end
end
