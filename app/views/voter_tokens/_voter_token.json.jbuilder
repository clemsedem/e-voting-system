json.extract! voter_token, :id, :voter_id, :token, :user_id, :active_status, :del_status, :created_at, :updated_at
json.url voter_token_url(voter_token, format: :json)
