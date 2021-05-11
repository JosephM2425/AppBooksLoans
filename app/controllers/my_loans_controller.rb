class MyLoansController < ApplicationController
  before_action :authenticate_user!
  before_action :set_loan, only: %i[ show ]
  protect_from_forgery except: :show
  
  def index
    @my_loans = current_user.loans.current_loans
  end

  def show
    respond_to do |format|
      if @loan.viewable_by?(current_user)
        format.html
      else
        format.html { redirect_to root_path, notice: "not access allowed" }
      end
    end
  end

  private

  def set_loan
    @loan = Loan.find(params[:id])
  end

end
