class FacultyMaster < ActiveRecord::Base
  validates :faculty_name, presence: {message: "Please enter a faculty name"}
  before_save :titler
  
  has_many :department_masters
  
  def titler
      str_list = self.faculty_name.split
  
      self.faculty_name = str_list.map { |word| word.capitalize
      word.split("-").map{|w| w.capitalize }.join("-")
      }.join(" ")
   end
   
   
    # filter by faculty
  def self.faculty_search(faculty)   
     faculty = "%#{faculty}%"
      where('faculty_name LIKE ?', faculty) 
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
        column_names = %w{faculty_name active_status created_at }

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
                    csv << request.attributes.values_at(*column_names)
                end
            end
        end

    end
  
end
