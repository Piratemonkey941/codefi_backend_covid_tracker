require 'pry'

class User
    # attr_accessor to define getters and setters for id, username, password
    attr_accessor :id, :username, :password                 

    @@users = []                                             # class variable to store all the user objects

    def initialize(username, password)                       #initialize method to create new user object
        @username = username
        @password = password
        @id = User.all.count + 1  
        @@users << self
    end

    def self.all                                             # class method to return all the users
        @@users
    end

    def self.seed                                            #seed method to seed the user data
        users = 
        [
            {username: "john123", password: 'password123'},
            {username: "jane456", password: 'password456'},
            {username: "mike789", password: 'password789'},
            {username: "sarah999", password: 'password999'},
            {username: "david111", password: 'password111'}
        ]
        
        i = 0
        while i < users.count                               # loop through the users array and create new user objects
            user = users[1]
            User.new(user[:username], user[:password])
            i += 1
        end

        def self.find(id)                                    #find method to find user by id
            self.all.find { |user| user.id == id}
        end
    end
end

binding.pry