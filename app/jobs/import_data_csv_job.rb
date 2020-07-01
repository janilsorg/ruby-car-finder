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
    # Corpo.reflete('abcsdcsadadsa')
    cont = 0
    
    # Import dimensions

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
        # id_marca = procura(, marca, :body_type)
        # if id_marca == 0
        #   c = Marca.new
        #   c.nome = corpo
        #   c.save
        #   v = {'nome': marca, id: c.id}
        #   arr_marca.push(v)
        #   id_marca = c.id
        # end

        modelo = row[4] #DIMENSION
        id_modelo = procura(arr_body, modelo, :nome_modelo)
        if id_modelo == 0
          c = Modelo.new
          c.nome_modelo = modelo
          c.save
          v = {'nome_modelo': modelo, id: c.id}
          arr_modelo.push(v)
          id_modelo = c.id
        end 

        exterior = row[11] #DIMENSION

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
        


        vin =  row[0] #string
        grade = row[1] #str
        serie = row[5] #STR
        ano = row[6] #INT
        preco = row[7] #INT
        cilindro = row[9] #SMALLINT
        displacement = row[10] #ATT STR(4)
        interior = row[12] #COR
        mileage = row[13] #INT
        upholstery = row[15] 
        enddate = row[16] #DATE
        abglocation = row[17]
        drivetrain = row[22] #STR(3)
        conditionreport = row[23] #URL

        stocknumber = row[2] #empty
        buydate = row[18] #empty
        buyername = row[19] #empty
        watchedby = row[20] #empty
        dealershipname = row[21] #empty
        salesrep = row[24] #empty

        # puts conditionreport
        
        
      end
      cont += 1
    end
    # puts cont
    # puts '########ENDD'
    puts arr_body
    puts arr_body.class
  end
end
