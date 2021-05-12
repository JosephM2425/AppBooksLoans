class Loan < ApplicationRecord
  belongs_to :user
  belongs_to :book
  #after_create :notification_loan_send
  
  scope :current_loans, ->() {where('start_date <= ? AND end_date >= ? AND active = true', Time.now.beginning_of_day, Time.now.end_of_day)}
  
  def viewable_by?(usr)
    self.user == usr
  end

  def notification_loan_send
    LoanMailer.notification_loan_send(self).deliver
  end

end
