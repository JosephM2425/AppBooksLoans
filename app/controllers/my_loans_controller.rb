class MyLoansController < ApplicationController
  before_action :authenticate_user!
  before_action :set_loan, only: %i[ show ]
  
  def index
    @my_loans = current_user.loans.current_loans
  end

  def show
    respond_to do |format|
      format.html { render :show }
      format.js 
    end
  end

  private

  def set_loan
    @loan = Loan.find(params[:id])
  end

end
