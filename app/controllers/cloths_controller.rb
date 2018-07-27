class ClothsController < ApplicationController
  before_action :sign_in_required, only: [:index] 
  before_action :set_cloth, only: [:show, :edit, :update, :destroy]

  # GET /cloths
  # GET /cloths.json
  def index
    @cloths = Cloth.all
    @categories = Category.all
  end

  # GET /cloths/1
  # GET /cloths/1.json
  def show
  end

  # GET /cloths/new
  def new
    @cloth = Cloth.new
  end

  # GET /cloths/1/edit
  def edit
  end

  # POST /cloths
  # POST /cloths.json
  def create
    @cloth = Cloth.new(cloth_params)

    respond_to do |format|
      if @cloth.save
        format.html { redirect_to @cloth, notice: 'Cloth was successfully created.' }
        format.json { render :show, status: :created, location: @cloth }
      else
        format.html { render :new }
        format.json { render json: @cloth.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cloths/1
  # PATCH/PUT /cloths/1.json
  def update
    respond_to do |format|
      if @cloth.update(cloth_params)
        format.html { redirect_to @cloth, notice: 'Cloth was successfully updated.' }
        format.json { render :show, status: :ok, location: @cloth }
      else
        format.html { render :edit }
        format.json { render json: @cloth.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cloths/1
  # DELETE /cloths/1.json
  def destroy
    @cloth.destroy
    respond_to do |format|
      format.html { redirect_to cloths_url, notice: 'Cloth was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  # 検索機能を実装
  def search
    @cloths=Cloth.where(category_id: params[:id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cloth
      @cloth = Cloth.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # Strong Parameters。URLから直接入力すればデータが登録できてしまうので、それを阻止するもの。
    def cloth_params
      params.require(:cloth).permit(:user_id, :name, :category_id, :color_id, :memo, :image)
    end
    

end
