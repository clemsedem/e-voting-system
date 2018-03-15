class AddVoterReason < ActiveRecord::Base
  # validates :reason, presence: {message: "Please fill in this space"}
  
  validates_length_of :reason, :allow_blank => false, :message=>"Please this field should be at least  {{count}} if you don't mind"
  validates :voter_id, presence: {message: "Please enter a voter id"}
end
