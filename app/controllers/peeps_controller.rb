# frozen_string_literal: true

class PeepsController < ApplicationController
  before_action :ensure_user, except: [:show, :index, :create]

  def index
    @peeps = Peep.all
  end

  def create
    current_user.peeps.create(content: params[:content], name: params[:name])
    redirect_to action: 'index'
  end

  def show
    @peep = Peep.find(params[:id])
  end

  def edit
    @peep = current_user.peeps.find(params[:id])
  end

  def update
    @peep = current_user.peeps.find(params[:id])
    if @peep.update(content: params[:content])
      flash[:notice] = 'Successfully updated peep!'
      redirect_to action: 'index'
    end
  end

  def destroy
    current_user.peeps.destroy(params[:id])
    redirect_to action: 'index'
  end

  def ensure_user
    if Peep.find(params[:id]).user != current_user
      flash[:alert] = "You can only update or delete your own peeps!"
      redirect_to peeps_url
    end
  end
end
