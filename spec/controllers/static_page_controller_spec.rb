require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  describe "#index" do

    before do
      @user = FactoryBot.create(:user)
    end

    it "responds successfully" do
      log_in(@user)
      get :home
      expect(response).to be_successful
    end

    it "returns a 200 response" do
      log_in(@user)
      get :home
      expect(response).to have_http_status "200"
    end

  end

  describe "#about" do

    before do
      @user = FactoryBot.create(:user)
    end

    it "responds successfully" do
      log_in(@user)
      get :about
      expect(response).to be_successful
    end

    it "returns a 200 response" do
      log_in(@user)
      get :about
      expect(response).to have_http_status "200"
    end

  end
  

end
