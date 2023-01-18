require 'bcrypt'
require 'pry'

module Auth
    def create_hash_digest(password)
        BCrypt::Password.create(password)

    end

    def authenticate_user(users, username, password)
        currentUser = nil
        users.each do |user|
            if user.username == username && user.password == password

            currentUser = user
            break;
            end
        end

        currentUser
    end
end


# needs comments
