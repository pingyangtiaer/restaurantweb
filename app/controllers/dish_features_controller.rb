class DishFeaturesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_store
  before_action :set_dish_feature, only: [:show, :edit, :update, :destroy]

  # GET /dish_features
  # GET /dish_features.json
  def index
    @dish_features = @store.dish_features.includes(:store)
  end

  # GET /dish_features/1
  # GET /dish_features/1.json
  def show
  end

  # GET /dish_features/new
  def new
    @dish_feature = @store.dish_features.build
  end

  # GET /dish_features/1/edit
  def edit
  end

  # POST /dish_features
  # POST /dish_features.json
  def create
    @dish_feature = @store.dish_features.build(dish_feature_params)

    respond_to do |format|
      if @dish_feature.save
        format.html { redirect_to store_dish_features_url(@store), notice: 'Dish feature was successfully created.' }
        format.json { render action: 'show', status: :created, location: @dish_feature }
      else
        format.html { render action: 'new' }
        format.json { render json: @dish_feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dish_features/1
  # PATCH/PUT /dish_features/1.json
  def update
    respond_to do |format|
      if @dish_feature.update(dish_feature_params)
        format.html { redirect_to store_dish_features_url(@store), notice: 'Dish feature was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dish_feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dish_features/1
  # DELETE /dish_features/1.json
  def destroy
    @dish_feature.destroy
    respond_to do |format|
      format.html { redirect_to store_dish_features_url(@store) }
      format.json { head :no_content }
    end
  end

  private
    def set_store
      @store = Store.find(params[:store_id])
      # @cartridge_array = @store.get_cartridge_array
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_dish_feature
      @dish_feature = DishFeature.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dish_feature_params
      params.require(:dish_feature).permit(:name, :bei, :rank, :store_id, :image)
    end
end
