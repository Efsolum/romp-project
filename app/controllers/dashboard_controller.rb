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

  def feed
    @events = Event.where('created_at >= :five_days_ago or updated_at >= :three_days_ago',
                          :five_days_ago  => Time.now - 5.days,
                          :three_days_ago => Time.now - 3.days)
    respond_to do |format|
      format.atom
    end
  end
end
