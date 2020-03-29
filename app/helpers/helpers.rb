class Helpers

    def self.current_user(c_user)
        User.find_by(id: c_user[:user_id])
    end

    def self.is_logged_in?(user)
        !!user[:user_id]
    end
end
