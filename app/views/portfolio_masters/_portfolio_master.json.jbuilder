json.extract! portfolio_master, :id, :ref_id, :portfolio, :user_id, :active_status, :del_status, :created_at, :updated_at
json.url portfolio_master_url(portfolio_master, format: :json)
