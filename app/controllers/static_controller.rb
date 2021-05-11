class StaticController < ApplicationController
  before_action :authenticate_user!
  def index
    @loans_by_month = Loan.group_by_month(:start_date).count
    @books = Book.group(:publisher).count
  end
end
