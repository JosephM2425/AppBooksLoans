json.extract! loan, :id, :user_id, :book_id, :start_date, :end_date, :active, :created_at, :updated_at
json.url loan_url(loan, format: :json)
