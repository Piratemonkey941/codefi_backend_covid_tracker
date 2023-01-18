require 'bcrypt'
require 'pry'

module Auth
    def self.create_hash_digest(password)
        BCrypt::Password.create(password)

    end
end

binding.pry