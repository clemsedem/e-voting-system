class ProgramMaster < ActiveRecord::Base
    
    validates :program_name, presence: {message: "Please enter a program name"}
    validates :department_id, presence: {message: "Please select a department"}
    before_save :titler
    
    belongs_to :department_master, class_name: 'DepartmentMaster', foreign_key: :department_id 
    has_many :registered_voters
    
     def titler
      str_list = self.program_name.split
  
      self.program_name  = str_list.map { |word| word.capitalize
      word.split("-").map{|w| w.capitalize }.join("-")
      }.join(" ")
   end
   
    # filter by program
  def self.program_search(program)   
      program = "%#{program}%"
      where('program_name LIKE ?', program) 
  end
  
  # filter by department
  def self.department_search(department)   
      department = "%#{department}%"
      joins(:department_master).where('department_masters.department_name LIKE ?', department) 
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
        column_names = %w{program_name department active_status created_at }

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
                 row[1]= request.department_master.department_name
                 row[2] = request.active_status ? 'Active' : 'Inactive'
                 csv << row
                end
            end
        end

    end
  
  
  
end
