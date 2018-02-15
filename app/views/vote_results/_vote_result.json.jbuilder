json.extract! vote_result, :id, :portfolio_id, :voter_id, :candidate_id, :user_id, :active_status, :del_status, :created_at, :updated_at
json.url vote_result_url(vote_result, format: :json)
