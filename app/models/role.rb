class Role < ActiveRecord::Base
   validates :name, presence: {message: "Please enter a role name"}
    before_save :titler
    
     # has_and_belongs_to_many :users
     has_many :users
   
    def titler
      str_list = self.name.split
  
      self.name  = str_list.map { |word| word.capitalize
      word.split("-").map{|w| w.capitalize }.join("-")
      }.join(" ")
   end
   
   # filter by username
  def self.role_name_search(name)   
      name = "%#{name}%" 
      where('name LIKE ?', name) 
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
        column_names = %w{name active_status created_at }

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
                    row[1] = request.active_status ? 'Active' : 'Inactive'
                    csv << row
                end
            end
        end

    end
  
  
   
end
