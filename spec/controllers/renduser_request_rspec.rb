require 'rails_helper'

RSpec.describe Renduser, type: :request do
  
  it "new path" do
    get new_renduser_registration_path
    expect(response).to be_successful
  end

  it "renduser path" do
    post renduser_session_path
    expect(response).to be_successful
  end

end
