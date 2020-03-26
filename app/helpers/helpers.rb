class Helpers

    def self.current_user(session)
        @user = User.find(session[:user_id])
        @user
    end

    def self.is_logged_in?(session)
        #!!session[:user_id]
        session.include?(:user_id)
    end
end


#These two methods will only ever be called in views, particularly account.erb, in order to add double protection to this view so that only the current user, when they are logged in, can see their bank account balance.
#current_user should accept the session hash as an argument. This method should use the user_id from the session hash to find the user in the database and return that user.
#is_logged_in? should also accept the session hash as an argument. This method should return true if the user_id is in the session hash and false if not. The Ruby !! operator will come in handy here.
