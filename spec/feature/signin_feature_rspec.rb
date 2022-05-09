require 'rails_helper'

feature 'User Signed in' do
    given!(:user) {@user = Renduser.new(email: 'test@railstest.com', role: 'admin', password: 'testpassword')}

    scenario 'with valid creds' do 
        visit "/rendusers/sign_in"
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        check 'Remember me'
        click_button 'Log in'
        
    end
end
