class SellpropsController < ApplicationController

def show
	@sellprop= Sellprop.find(params[:id])
end
def index
    @sellprops= Sellprop.all
	@show_heading=1
	end
def create
	@sellprop = current_user.sellprops.build(params[:sellprop])
	if @sellprop.save
	flash[:success] = "Your property has been listed!"
	redirect_to root_path
	else
	render 'pages/home'
	end
end
def apply
    @user=current_user
	@sellprop=Sellprop.find(params[:id])
	@new_bid=Bid.new
	render 'users/bid_form'
end
def create_bid
	@nbid = current_user.bids.create!(params[:bid])
	if @nbid.save
	flash[:success] = "Your bid has been listed!"
	redirect_to '/sellprops'
	end
	end
def modify_bid
	@sellprop= Sellprop.find(params[:id])
	@old_bid=current_user.bids.find_by_sellprop_id(@sellprop.id)
	@title= "Modify your bid!"
	render 'sellprops/edit_bid'
	end
def update_bid
	@user = current_user
	@sellprop= Sellprop.find(params[:id])
	@old_bid=current_user.bids.find_by_sellprop_id(@sellprop.id)
	if(params[:delete_bid]== 'selected')
	current_user.bids.find_by_sellprop_id(@sellprop.id).destroy
	flash[:success] = "Bid deleted."
	redirect_to '/sellprops'
	elsif @old_bid.update_attributes(params[:bid])
	flash[:success] = "Bid updated."
	redirect_to '/sellprops'
	else
	@title = "Edit user"
	redirect_to '/sellprops'
	end
	end
	
def destroy
@sellprop=Sellprop.find(params[:id])
@sellprop.destroy
redirect_back_to root_path
end
private
def authorized_user
@sellprop= Sellprop.find(params[:id])
redirect_to root_path unless current_user?(@sellprop.user)
end
end