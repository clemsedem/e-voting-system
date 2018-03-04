class PortfolioMaster < ActiveRecord::Base
  self.primary_key = 'ref_id'
  validates :portfolio, presence: {message: "Please enter a portfolio"}
  validates :ref_id, presence: {message: "Please enter a unique id for the portfolio"}
  before_save :titler
  
  has_many :candidates, foreign_key: :portfolio_id
  
  def titler 
      str_list = self.portfolio.split
  
      self.portfolio  = str_list.map { |word| word.capitalize
      word.split("-").map{|w| w.capitalize }.join("-")
      }.join(" ")
   end
   
    # filter by portfolio
  def self.portfolio_search(portfolio)   
      portfolio = "%#{portfolio}%" 
      where('portfolio LIKE ?', portfolio) 
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
        column_names = %w{portfolio  active_status created_at }

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
