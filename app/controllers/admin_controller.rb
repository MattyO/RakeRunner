class AdminController < ApplicationController
  def index
    require_user
  end
end
