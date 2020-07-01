class AdicionarDemaisCampos < ActiveRecord::Migration[6.0]
  def change
    add_column :carros, :vin, :string
    add_column :carros, :grade, :string
    add_column :carros, :serie, :string
    add_column :carros, :preco, :integer
    add_column :carros, :cilindro, :integer
    add_column :carros, :displacement, :string
    add_column :carros, :interior, :string
    add_column :carros, :mileage, :integer
    add_column :carros, :upholstery, :string
    add_column :carros, :enddate, :date
    add_column :carros, :abglocation, :string
    add_column :carros, :drivetrain, :string
    add_column :carros, :conditionreport, :string

    add_column :carros, :stocknumber, :string
    add_column :carros, :buydate, :date
    add_column :carros, :buyername, :string
    add_column :carros, :watchedby, :string
    add_column :carros, :dealershipname, :string
    add_column :carros, :salesrep, :string

  end
end
