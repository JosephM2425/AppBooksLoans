class MyLoansController < ApplicationController
  def index
    @my_loans = current_user.loans.current_books
  end

  def show
  end
end
