require 'pry'
require_relative 'auth.rb'

class User
    extend Auth

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
            {username: "john123", password: "password"},
            {username: "jane456", password: "password"},
            {username: "mike789", password: "password"},
            {username: "sarah999", password: "password"},
            {username: "david111", password: "password"}
        ]
        
        i = 0
        while i < users.count                               # loop through the users array and create new user objects
            user = users[i]
            User.new(user[:username], create_hash_digest(user[:password]))
            i += 1
        end

        def self.find(id)                                    #find method to find user by id
            self.all.find { |user| user.id == id}
        end
    end
end

