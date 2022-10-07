require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  let(:user)  { User.create(name: "some",email: 'other@example.com', password: 'rous',password_confirmation: "some") }

  describe "get login path" do
    it "login page" do
      get :new
      expect(response).to render_template('sessions/new')
    end
  end

  describe "valid attributes" do
    it "create a session" do
      post :create, session: { email: user.email, password: user.password }
      expect(response.status).to render_template('/')
    end
  end

  describe "invalid attributes" do
    it "does not create a session" do
      post :create, session: { email: user.email, password: "12345" }
      expect(response.status).to render_template('sessions/new')
    end
  end


  describe "does not create a session" do

    it "if email is empty" do
      post :create, session: {password: "some"}
      expect(response.status).to render_template('sessions/new')
    end

    it "if password is empty" do
      post :create, session: {email: "some@gmail.com"}
      expect(response.status).to render_template('sessions/new')
    end

  end
end