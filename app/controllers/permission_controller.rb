class PermissionController < ApplicationController
  skip_before_filter :authorize
  skip_before_filter :isAdmin

  def index
  end

end
