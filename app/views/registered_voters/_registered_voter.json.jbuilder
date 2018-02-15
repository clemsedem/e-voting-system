json.extract! registered_voter, :id, :voter_id, :surname, :other_names, :level_id, :session_id, :program_id, :gender_id, :vote_status, :user_id, :active_status, :del_status, :created_at, :updated_at
json.url registered_voter_url(registered_voter, format: :json)
