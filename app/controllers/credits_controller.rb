class CreditsController < ApplicationController

  def index
    @credits = Credit.all
      @user = current_user
  end

  def new
    @credit = Credit.new
  end

  def create
    @credit = Credit.new(credit_params)
      if @credit.save
        redirect_to credit_path(@credit)
      else
        render :new
      end
    end

 def update
   @credit = set_credit
   @credit.update(credit_params)
   redirect_to credit_path(@credit)
 end

  def show
    @credit = set_credit
      @user = current_user
        @exposure = Exposure.create(user_id: @user.id, credit_id: @credit.id)
  end

  def edit
    @credit = set_credit
  end

  def destroy
    Credit.find(params[:id]).destroy
    redirect_to credits_path
  end



 private

 def set_credit
    @credit = Credit.find(params[:id])
  end

  def credit_params
    params.require(:credit).permit(:credit_name, :rating, :sector, :state)
  end


end
