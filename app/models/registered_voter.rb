class RegisteredVoter < ActiveRecord::Base
  self.primary_key = 'voter_id'
  
  validates :voter_id, presence: {message: "Please enter a voter id"}
  validates :surname, presence: {message: "Please enter a surname"}
  validates :other_names, presence: {message: "Please enter a other name"}
  validates :level_id, presence: {message: "Please select a level for the voter"}
  validates :session_id, presence: {message: "Please select a session for the voter"}
  validates :program_id, presence: {message: "Please select a program offerd by the voter"}
  validates :gender, presence: {message: "Please select a gender for the voter"}
  
  before_save :titler_surname, :titler_other_names
  
  
  belongs_to :level_master, class_name: 'LevelMaster', foreign_key: :level_id
  belongs_to :session_master, class_name: 'SessionMaster', foreign_key: :session_id
  belongs_to :program_master, class_name: 'ProgramMaster', foreign_key: :program_id
  
  has_many :candidates, foreign_key: :voter_id
  
  
  
  def titler_surname
      str_list = self.surname.split
  
      self.surname  = str_list.map { |word| word.capitalize
      word.split("-").map{|w| w.capitalize }.join("-")
      }.join(" ")
   end
   
   def titler_other_names
      str_list = self.other_names.split
  
      self.other_names  = str_list.map { |word| word.capitalize
      word.split("-").map{|w| w.capitalize }.join("-")
      }.join(" ")
   end
  
  
    # filter by voter id 
  def self.voter_search(voter)   
      voter = "%#{voter}%"
      where('voter_id LIKE ?', voter) 
  end
  
  # filter by program
  def self.program_search(program)   
      program = "%#{program}%"
      joins(:program_master).where('program_masters.program_name LIKE ?', program) 
  end
  
  # filter by session
  def self.session_search(session)   
      session = "%#{session}%"
      joins(:session_master).where('session_masters.session LIKE ?', session) 
  end
  
  # filter by level
  def self.level_search(level)   
      level = "#{level}"
      joins(:level_master).where('level_masters.level = ?', level) 
  end

  # filter by date
  def self.search_date(start = nil, ended = nil)
    if start && ended
      where(created_at: "#{start}".."#{ended}")
    else
      all
    end
  end
  
  
  def self.to_csv(options = {}, page=nil, perpage=nil)
        column_names = %w{voter_id surname other_names program level session active_status created_at }

        if page and perpage

            page = page.to_i
            perpage= perpage.to_i

            off = perpage*(page - 1)
 
            CSV.generate(options) do |csv|
                csv << column_names
               limit(perpage).offset(off).each do |request|
                    csv << request.attributes.values_at(*column_names)
                end
            end

        else
            CSV.generate(options) do |csv|
                csv << column_names
                 all.each do |request|
                 
                 row = request.attributes.values_at(*column_names) 
                 row[3]= request.program_master.program_name
                 row[4]= request.level_master.level
                 row[5]= request.session_master.session
                 row[6] = request.active_status ? 'Active' : 'Inactive'
                 csv << row
                end
            end
        end

    end
  
  
  
  
  
  
  
end
