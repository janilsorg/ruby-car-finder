require 'csv'

class ImportDataCsvJob < ApplicationJob
  queue_as :default

  # Method to check if exists
  def procura(v, valor, att)
    r = v.select{|x| x[att] == valor}
    
    if(r.length > 0)
      return r[0][:id]
    end
    return 0
  end

  def perform(*args)
    # Delete all
    # Post.delete_all
    Carro.delete_all
    Modelo.delete_all
    Cor.delete_all
    Corpo.delete_all
    Marca.delete_all
    Transmission.delete_all

    vetor = []
    a = {'nome':'janilson', idade: 23, id: 21}
    b = {'nome':'aluno2', idade: 35, id:2}
    vetor.push(a)
    vetor.push(b)
    
    resultado = procura(vetor, 'janilson', :nome)
    puts resultado.to_s


    arr_body = []
    arr_modelo = []
    arr_exterior = []
    arr_marca = []
    arr_transm = []

    # Do something later
    puts 'Importing data from CSV file ...'

    filename = File.dirname(File.dirname(File.expand_path(__FILE__))) + '/data/vehicles_list.csv'
    cont = 0

    CSV.foreach(filename, { :col_sep => ';' }) do |row|

      if (cont>0)

        corpo = row[8] #DIMENSION
        id_corpo = procura(arr_body, corpo, :body_type)
        if id_corpo == 0
          c = Corpo.new
          c.body_type = corpo
          c.save
          v = {'body_type': corpo, id: c.id}
          arr_body.push(v)
          id_corpo = c.id
        end
        
        marca = row[3]  #DIMENSION
        id_marca = procura(arr_marca, marca, :nome)
        if id_marca == 0
          c = Marca.new
          c.nome = marca
          c.save
          v = {'nome': marca, id: c.id}
          arr_marca.push(v)
          id_marca = c.id
        end
        
        modelo = row[4] #DIMENSION
        id_modelo = procura(arr_modelo, modelo, :nome_modelo)
        if id_modelo == 0
          c = Modelo.new
          c.nome_modelo = modelo
          c.save
          v = {'nome_modelo': modelo, id: c.id}
          arr_modelo.push(v)
          id_modelo = c.id
        end 
        
        # COR!!! TO DO
        exterior = row[11] #DIMENSION
        id_cor = procura(arr_exterior, exterior, :color_name)
        if id_cor == 0
          c = Cor.new
          c.color_name = exterior
          c.save
          v = {'color_name': exterior, id: c.id}
          arr_exterior.push(v)
          id_cor = c.id
        end
        
        
        transmission = row[14] #DIMENSION
        id_transmission = procura(arr_transm, transmission, :transmission_type)
        if id_transmission == 0
          c = Transmission.new
          c.transmission_type = transmission
          c.save
          v = {'transmission_type': transmission, id: c.id}
          arr_transm.push(v)
          id_transmission = c.id
        end 
        
        # novo_carro = Carro.new
        
        # novo_carro.transmission_id = id_transmission
        # novo_carro.cor_id = id_cor
        # novo_carro.modelo_id = id_modelo
        # novo_carro.corpo_id = id_corpo
        # novo_carro.marca_id = id_marca


        # novo_carro.vin =  row[0] #string
        # novo_carro.grade = row[1] #str
        # novo_carro.serie = row[5] #STR
        # novo_carro.ano = row[6] #INT
        # novo_carro.preco = row[7] #INT
        # novo_carro.cilindro = row[9] #SMALLINT
        # novo_carro.displacement = row[10] #ATT STR(4)
        # novo_carro.interior = row[12] #COR
        # novo_carro.mileage = row[13] #INT
        # novo_carro.upholstery = row[15] 
        # novo_carro.enddate = row[16] #DATE
        # novo_carro.abglocation = row[17]
        # novo_carro.drivetrain = row[22] #STR(3)
        # novo_carro.conditionreport = row[23] #URL

        # novo_carro.stocknumber = row[2] #empty
        # novo_carro.buydate = row[18] #empty
        # novo_carro.buyername = row[19] #empty
        # novo_carro.watchedby = row[20] #empty
        # novo_carro.dealershipname = row[21] #empty
        # novo_carro.salesrep = row[24] #empty
        
      end
      cont += 1
    end
    # puts cont
    
  end
end
