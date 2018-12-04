class MosquesController < InheritedResources::Base
	before_action :authenticate_user!


	def index
    @mosque = current_user.mosque
  end

 
  def show
  end

  
  def new
    @mosque = Mosque.new
  end

  
  def edit
  end

  
  def create
    @mosque = current_user.create_mosque(mosque_params)

    respond_to do |format|
      if @mosque.save
        format.html { redirect_to user_mosques_path(current_user), notice: 'Mosque was successfully created.' }
        format.json { render :show, status: :created, location: @mosque }
      else
        format.html { render :new }
        format.json { render json: @mosque.errors, status: :unprocessable_entity }
      end
    end
  end

  
  
  def update
    respond_to do |format|
      if @mosque.update(mosque_params)
        format.html { redirect_to user_mosque_path(current_user), notice: 'Mosque was successfully updated.' }
        format.json { render :show, status: :ok, location: @mosque }
      else
        format.html { render :edit }
        format.json { render json: @mosque.errors, status: :unprocessable_entity }
      end
    end
  end

  # def destroy
  #   @mosque.destroy
  #   respond_to do |format|
  #     format.html { redirect_to user_mosque_path(current_user), notice: 'Mosque was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private

    def mosque_params
      params.require(:mosque).permit(:name, :address, :latitude, :longitude, :user_id, :country, :city, :zipcode)
    end
end

