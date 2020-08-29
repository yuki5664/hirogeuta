require 'rails_helper'

RSpec.describe MicropostsController, type: :controller do

  describe "#show" do
    context "as an authorized user" do
      before do
        @user = FactoryBot.create(:user)
        @post = FactoryBot.create(:micropost, owner: @user)
      end

      it "responds successfully" do
        log_in(@user)
        get :show, params: { id: @post.id}
        expect(response).to be_successful
      end
    end

    context "as an unauthorized user" do
      before do
        @user = FactoryBot.create(:user)
        other_user = FactoryBot.create(:user)
        @post = FactoryBot.create(:micropost, owner: @user)
      end

      it "redirects to the dashboard" do
        get :show, params: { id: @post.id }
        expect(response).to redirect_to "/login"
      end
    end
  end

  

  describe "#create" do
    context "as an authenticated user" do
      before do
        @user = FactoryBot.create(:user)
      end

      context "with valid attributes" do
        it "adds a post" do
          post_params = FactoryBot.attributes_for(:micropost)
          log_in(@user)
          expect {
            post :create, params: { micropost: post_params }
          }.to change(@user.microposts, :count).by(1)
        end       
      end
      context "with invalid attributes" do
        
        it "adds a post" do
          post_params = FactoryBot.attributes_for(:micropost, :invalid)
          log_in(@user)
          expect {
            post :create, params: { micropost: post_params }
          }.to_not change(@user.microposts, :count)
        end       
      end     
    end

    context "as a guest" do
      it "return a 302 response" do
        post_params = FactoryBot.attributes_for(:micropost)
        post  :create, params: { micropost: post_params }
        post :create, params: { micropost: post_params }
        expect(response).to have_http_status "302"
      end

      it "redirects to the sign_in page" do
        post_params = FactoryBot.attributes_for(:micropost)
        post :create, params: { micropost: post_params }
        expect(response).to redirect_to "/login"
      end
    end
  end

  describe "#destory" do
    context "as an authorized user" do 
      before do
        @user = FactoryBot.create(:user)
        @post = FactoryBot.create(:micropost, owner: @user)
      end

      it "deletes a post" do 
        log_in(@user)
        expect {
          delete :destroy, params: { id: @post.id}
        }.to change(@user.microposts, :count).by(-1)
      end
    end

    context "as an unauthorized user" do
      before do
        @user = FactoryBot.create(:user)
        other_user = FactoryBot.create(:user)
        @post = FactoryBot.create(:micropost, owner: other_user)
      end

      it "dose not delete the post" do
        log_in(@user)
        expect {
          delete :destroy, params: { id: @post.id }
        }.to_not change(Micropost, :count)
      end

      it "redirects to the dashboard" do
        log_in(@user)
        delete :destroy, params: { id: @post.id }
        expect(response).to redirect_to root_path
      end
    end

    context "as a guest" do
      before do
        @post = FactoryBot.create(:micropost)
      end

      it "returns a 302 response" do
        delete :destroy, params: { id: @post.id }
        expect(response).to have_http_status "302"
      end
      
      it "redirects to the login page" do
        delete :destroy, params: { id: @post.id }
        expect(response).to redirect_to "/login"
      end

      it "dose not delete the post" do
        expect {
          delete :destroy, params: { id: @post.id }
        }.to_not change(Micropost, :count)
      end
    end
  end
end
