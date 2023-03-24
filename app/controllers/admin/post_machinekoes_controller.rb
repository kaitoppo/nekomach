class Admin::PostMachinekoesController < ApplicationController

  def index
    @post_machinekoes = PostMachineko.all
  end

  def show
    @post_machineko = PostMachineko.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
  end

  def matchineko_search
  end
end
