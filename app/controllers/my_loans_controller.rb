class MyLoansController < ApplicationController
  before_action :authenticate_user!
  before_action :set_loan, only: %i[ show ]
  
  def index
    @my_loans = current_user.loans.current_books
  end

  def show
  end

  private

  def set_loan
    @loan = Loan.find(params[:id])
  end

end
