json.extract! expense, :id, :description, :date, :value, :status, :picture, :user_id, :created_at, :updated_at
json.url expense_url(expense, format: :json)
