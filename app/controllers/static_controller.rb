class StaticController < ApplicationController
	skip_before_action :require_login
  def top
  end
end
