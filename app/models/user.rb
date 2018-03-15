class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :username, presence: {message: "Please enter a username"}
  validates_uniqueness_of :username
  
  before_save :titler_surname, :titler_other_names
  
  # has_and_belongs_to_many :roles
   belongs_to :role, class_name: "Role", foreign_key: :role_id 
  
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
         
  def email_required?
    false
  end

  def email_changed?
    false
  end
  
  
   
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
  
  # filter by username
  def self.username_search(username)   
      username = "%#{username}%" 
      where('username LIKE ?', username) 
  end
  
  
   # filter by role
  def self.role_search(role)   
      role = "%#{role}%"
      joins(:role).where('roles.name LIKE ?', role) 
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
        column_names = %w{surname other_names username role active_status created_at }

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
                 row[3]= request.role.name
                 row[4] = request.active_status ? 'Active' : 'Inactive'
                 csv << row
                end
            end
        end

    end
  
  
  
   
end
