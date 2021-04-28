class Loan < ApplicationRecord
  belongs_to :user
  belongs_to :book
  
  scope :current_books, ->() {where('start_date <= ? AND end_date > ?', Time.now.beginning_of_day, Time.now.end_of_day)}

end
