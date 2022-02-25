class WelcomeMailer < ApplicationMailer

    def welcome_send(user)
        @user = user
        mail to: user.email, subject: "Welcome to our Disney App", from: "info@disney.us"
    end

end