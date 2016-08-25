class StaticPagesController < ApplicationController
  def home
    @experience = current_user.experinces.build if logged_in?
  end
end
