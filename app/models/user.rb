class User < ApplicationRecord
    has_secure_token :token

    before_save :downcase_fields

    def downcase_fields
       self.login.downcase!
    end

    def auth(password) 
        return password === self.password
    end
end
