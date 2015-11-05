# -*- coding: utf-8 -*-
class DashboardController < ApplicationController
  before_action :authenticate, only: [:admin]

  def index
    @title = 'Welcome To Romp International'
    @content = '
In only (3) three years Romp International (Romp) has become one of Barbados most improved small bands on the road for 2015. Romp is known for being the hypest bands on the road for Kadooment, this reputation wasn’t built overnight; it takes time and patience. Romp also caterers to all sizes by making costumes to compliment the full figured woman while making her look and feel sexy.
The extraordinary history to Romp is due to the founder for her passion and commitment to this band. This success is also partly due to her ability to listen to people, observe and react to current trends and anticipate the wishes of her customers. This band has survived through the economic downturn in the island and continues to be innovators overcoming obstacles. It is thanks to the value placed on the men and women who come together to make this organization great.'
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
