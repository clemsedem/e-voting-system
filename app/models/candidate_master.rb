class CandidateMaster < ActiveRecord::Base
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "120x120#" }
   validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/ 
   validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
  # self.primary_key = 'voter_id'
  validates :voter_id, presence: {message: "Please select a voter id"}
  validates :portfolio_id, presence: {message: "Please select a voter id"}
  
  belongs_to :registered_voter, class_name: 'RegisteredVoter', foreign_key: :voter_id
  
  belongs_to :portfolio_master, class_name: 'PortfolioMaster', foreign_key: :portfolio_id
  
  has_many :vote_results, foreign_key: :voter_id
  
  # filter by portfolio
  def self.portfolio_search(portfolio)    
      portfolio = "%#{portfolio}%"
      joins(:portfolio_master).where('portfolio_masters.portfolio LIKE ?', portfolio) 
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
        column_names = %w{surname other_names portfolio active_status created_at }

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
                 row[0]= request.registered_voter.surname 
                 row[1]=request.registered_voter.other_names
                 row[2]= request.portfolio_master.portfolio
                 row[3] = request.active_status ? 'Active' : 'Inactive'
                 csv << row
                end
            end
        end

    end
  
  
  
  
end
