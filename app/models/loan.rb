class Loan < ApplicationRecord
  belongs_to :user
  belongs_to :book
  
  scope :current_loans, ->() {where('start_date <= ? AND end_date >= ? AND active = true', Time.now.beginning_of_day, Time.now.end_of_day)}

  def viewable_by?(usr)
    self.active && self.user == usr
  end
end
