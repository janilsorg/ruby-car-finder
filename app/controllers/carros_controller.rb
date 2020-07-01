class CarrosController < ApplicationController
  before_action :set_carro, only: [:show, :edit, :update, :destroy]

  # GET /carros
  # GET /carros.json
  def index
    # ImportDataCsvJob.perform_later
  
    @carros = Carro.all.limit(20)
    
    if @carros.length > 0
      @got_data = true
    else
      @got_data = false
    end

    @cor = params[:cor]
    @cores = Cor.all
    if  @cor.nil? || @cor.empty?
      # @cores = Cor.all
    else
      @carros = @carros.where("cor_id = ?", @cor)
    end 

    # Body - Corpo, body_type
    @corpos = Corpo.all
    @corpo = params[:corpo]
    if  @corpo.nil? || @corpo.empty?
      # 
    else
      @carros = @carros.where("corpo_id = ?", @corpo)
    end 

    
    # mileage
    @m_ini = params[:m_ini]
    if  @m_ini.nil? || @m_ini.empty?
      # 
    else
      @carros = @carros.where("mileage >= ?", @m_ini)
    end 

    @m_end = params[:m_end]
    if  @m_end.nil? || @m_end.empty?
      # 
    else
      @carros = @carros.where("mileage >= ?", @m_end)
    end 

    # price
    @price = params[:price]
    if  @price.nil? || @price.empty?
      # 
    else
      @carros = @carros.where("preco >= ?", @price)
    end 
    

  end

  # GET /carros/1
  # GET /carros/1.json
  def show
  end

  # GET /carros/new
  def new
    @carro = Carro.new
    @marcas = Marca.all
  end

  # GET /carros/1/edit
  def edit
    @marcas = Marca.all
  end

  # POST /carros
  # POST /carros.json
  def create
    @carro = Carro.new(carro_params)

    respond_to do |format|
      if @carro.save
        format.html { redirect_to @carro, notice: 'Carro was successfully created.' }
        format.json { render :show, status: :created, location: @carro }
      else
        format.html { render :new }
        format.json { render json: @carro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carros/1
  # PATCH/PUT /carros/1.json
  def update
    respond_to do |format|
      if @carro.update(carro_params)
        format.html { redirect_to @carro, notice: 'Carro was successfully updated.' }
        format.json { render :show, status: :ok, location: @carro }
      else
        format.html { render :edit }
        format.json { render json: @carro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carros/1
  # DELETE /carros/1.json
  def destroy
    @carro.destroy
    respond_to do |format|
      format.html { redirect_to carros_url, notice: 'Carro was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_carro
      @carro = Carro.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def carro_params
      params.require(:carro).permit(:nome, :ano, :marca_id)
    end
end
