class LevelMaster < ActiveRecord::Base
  validates :level, presence: {message: "Please enter a level"}
  
  has_many :registered_voters
  
  # filter by portfolio
  def self.level_search(level)   
      level = "#{level}" 
      where('level = ?', level) 
  end
  
  # # filter by faculty
  # def self.faculty_search(faculty)   
      # faculty = "%#{faculty}%"
      # joins(:faculty_master).where('faculty_masters.faculty_name LIKE ?', faculty) 
  # end
  
  
  # filter by date
  def self.search_date(start = nil, ended = nil)
    if start && ended
      where(created_at: "#{start}".."#{ended}")
    else
      all
    end
  end
  
  
  
  
   def self.to_csv(options = {}, page=nil, perpage=nil)
        column_names = %w{level  active_status created_at }

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
                 # row[1]= request.faculty_master.faculty_name
                 # row[2] = request.active_status ? 'Active' : 'Inactive'
                 row[1] = request.active_status ? 'Active' : 'Inactive'
                 csv << row
                end
            end
        end

    end
  

end
