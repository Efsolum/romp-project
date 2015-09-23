class DashboardController < ApplicationController
  before_action :authenticate, only: [:admin]

  def index
    @content = 'Welcome to Romp International'
  end

  def about
    @content = "Romp International is a Kadooment Band based in Barbados"
  end

  def contact
  end

  def admin
  end
end
