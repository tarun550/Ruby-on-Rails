class PagesController < ApplicationController

  def home
  @title="Home"
  @sellprop = Sellprop.new if signed_in?
  end
  def contact
  @title="Contact"
  end  
  def about
  @title="About Us"
  end
end
