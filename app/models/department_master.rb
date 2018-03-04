class DepartmentMaster < ActiveRecord::Base
    validates :department_name, presence: {message: "Please enter a department name"}
    validates :faculty_id, presence: {message: "Please select a faculty"}
    before_save :titler
  
   belongs_to :faculty_master, class_name: 'FacultyMaster', foreign_key: :faculty_id 
   has_many :program_masters, foreign_key: :department_id
  
   def titler
      str_list = self.department_name.split
  
      self.department_name  = str_list.map { |word| word.capitalize
      word.split("-").map{|w| w.capitalize }.join("-")
      }.join(" ")
   end
   
    # filter by department
  def self.department_search(department)   
      department = "%#{department}%"
      where('department_name LIKE ?', department) 
  end
  
  # filter by faculty
  def self.faculty_search(faculty)   
      faculty = "%#{faculty}%"
      joins(:faculty_master).where('faculty_masters.faculty_name LIKE ?', faculty) 
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
        column_names = %w{department_name faculty active_status created_at }

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
                 row[1]= request.faculty_master.faculty_name
                 row[2] = request.active_status ? 'Active' : 'Inactive'
                 csv << row
                end
            end
        end

    end
   
   
  
end
