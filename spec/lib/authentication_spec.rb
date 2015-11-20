require 'spec_helper'

class Controller
  include Authentication
  attr_accessor :session

  def initialize
    self.session = {}
  end

  def find_current_user
    if session[:current_user_id]
      true
    else
      nil
    end
  end
end

class User
  def initialize(attributes)
    @attributes = attributes
  end
  def id
    @attributes[:id]
  end
end

describe Authentication do
  let(:controller) { Controller.new }
  let(:user)       { User.new(id: 300) }

  describe '#login!' do
    context 'with nil' do
      it "should raise Unauthenticated" do
        expect do
          controller.login! nil
        end.to raise_error Authentication::Unauthenticated
      end
    end
  end

  describe '#current_user' do
    context 'when logged in' do
      it "should return user" do
        controller.login! user
        expect(controller.current_user).to eq user
      end
    end
    context 'when not logged in' do
      it "should call #find_current_user and return its result" do
        expect(controller).to receive(:find_current_user).and_return "something"
        expect(controller.current_user). to eq "something"
      end
    end
  end

  describe '#current_user_id' do
    context 'when logged in' do
      it "should return user_id" do
        controller.login! user
        expect(controller.current_user_id).to eq user.id
      end
    end
    context 'when not logged in' do
      it "should return nil" do
        expect(controller.current_user_id).to eq nil
      end
    end
  end

  describe '#logged_in?' do
    context 'when logged in' do
      it "should return true" do
        controller.login! user
        expect(controller).to be_logged_in
      end
    end
  end

  describe '#logout!' do
    context 'when logged in' do
      it "should set current_user to nil" do
        controller.login! user
        controller.logout!
        expect(controller.current_user).to eq nil
        expect(controller.session[:current_user_id]).to eq nil
      end
    end
  end
end
