class AddBodyReferencetoCarro < ActiveRecord::Migration[6.0]
  def change
    add_reference :carros, :modelo, index: true, foreign_key:true
  end
end
