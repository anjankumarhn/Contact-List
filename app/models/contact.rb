class Contact < ActiveRecord::Base
      validates :firstname, :lastname, :email, :phonenumber, presence: true,
                    length: { minimum: 5}
        validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create

        validates_format_of :phonenumber, :with =>  /\d[0-9]\)*\z/ ,on: :create
        validates_presence_of :phonenumber, :maximumlength => 10, on:create
    

    def self.search(search)
 		if search
    		self.where("firstname LIKE ?", "#{search}%")
    	else
    		self.all
  		end
	end


end
