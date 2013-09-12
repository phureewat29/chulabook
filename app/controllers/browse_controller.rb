class BrowseController < ApplicationController
  
  before_filter :update_scribblestreams, :only => [:home, :refreshscribbles]
  
  def home
  end

 def votedup
 @scribble = Scribble.find(params[:id])
 @scribble.ups=@scribble.ups+1
 @scribble.save
 render :text => "<div class='up'></div><i class='icon-thumbs-up'></i> "+@scribble.ups.to_s+" Likes"
 end

 def voteddown
 @scribble = Scribble.find(params[:id])
 @scribble.downs=@scribble.downs+1
 @scribble.save
 render :text => "<div class='down'></div><i class='icon-thumbs-down'></i> "+@scribble.downs.to_s+" Dislikes"
 end
  
  def refreshscribbles
  render :partial => 'scribbles.html.erb', :locals => { :scribbles_streams => @scribbles_streams }
  end

  protected
  def update_scribblestreams
  @scribbles_streams = Scribble.order('created_at DESC').all
  end 
end
