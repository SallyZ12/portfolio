class CreditsController < ApplicationController

  def index
    @credits = Credit.all
  end

  def new
    @credit = Credit.new
  end

  def show
    @credit = set_credit
  end





 private

 def set_credit
   @credit = set_credit
    @credit.update(credit_params)
    redirect_to credit_path(@credit)
  end

  def credit_params
    params.require(:credit).permit(:credit_name, :rating, :sector, :state)
  end


end
