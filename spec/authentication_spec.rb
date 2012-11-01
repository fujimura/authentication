require 'rspec'
require File.expand_path(__FILE__ + './../../lib/authentication')

class Controller
  include Authentication
  attr_accessor :session

  def initialize
    self.session = {}
  end

  def find_current_user success = true
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
        controller.current_user.should == user
      end
    end
    context 'when not logged in' do
      it "should call #find_current_user and return its result" do
        controller.should_receive(:find_current_user).and_return "something"
        controller.current_user.should == "something"
      end
    end
  end
  describe '#logged_in?' do
    context 'when logged in' do
      it "should return true" do
        controller.login! user
        controller.logged_in?.should == true
      end
    end
  end

  describe '#logout!' do
    context 'when logged in' do
      it "should set current_user to nil" do
        controller.login! user
        controller.logout!
        controller.current_user.should == nil
        controller.session[:current_user_id].should == nil
      end
    end
  end
end
