require 'bcrypt'
require 'pry'

module Auth
    # This method creates a hash digest of the given password using the 
    # BCrypt library
    def create_hash_digest(password)
        BCrypt::Password.create(password)

    end

    # This method checks if the given username and password match any 
    # of the users in the users array
    # If a match is found, the corresponding user is returned, otherwise 
    # nil is returned
    def self.authenticate_user(users, username, password)
        currentUser = nil
        users.each do |user|
            # Check if the username and password match the current user
            if user.username == username && user.password == password

             # Assign the matching user to currentUser and break out of the loop    
            currentUser = user
            break;
            end
        end

        currentUser
    end
end



