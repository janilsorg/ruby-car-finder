class AddCorpoReferencestoCarro < ActiveRecord::Migration[6.0]
  def change
    add_reference :carros, :corpo, index: true, foreign_key:true
    add_reference :carros, :transmission, index: true, foreign_key:true
  end
end
