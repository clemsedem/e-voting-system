json.extract! session_master, :id, :session, :user_id, :active_status, :del_status, :created_at, :updated_at
json.url session_master_url(session_master, format: :json)
