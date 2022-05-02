class UserMailer < ApplicationMailer
  default :from => "actionmailerpractical@simform.com"
  
  def welcome_email
    @amuser = params[:amuser]
    @url = "http://eample.com/login"
    attachments.inline['filename.jpg'] = File.read("/home/chitrakbhatt/Backup/Rails/RailsPractical/public/#{@amuser.picture.url}")
    mail(to: @amuser.email, subject: 'Welcome to My ActionMailer Site') do |format|
      format.text
      format.html {render layout: 'welcome_email'}
    end
  end

  def update_email
    @amuser = params[:amuser]
    attachments.inline['filename.jpg'] = File.read("/home/chitrakbhatt/Backup/Rails/RailsPractical/public/#{@amuser.picture.url}")
    mail(to: @amuser.email, subject: 'Update Email') do |format|
      format.html {render layout: 'update_email'}
      format.text
    end
  end
end
