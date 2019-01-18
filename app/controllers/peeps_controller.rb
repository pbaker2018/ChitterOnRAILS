# frozen_string_literal: true

class PeepsController < ApplicationController
  def index
    @peeps = Peep.all
  end

  def create
    Peep.create(content: params[:content], name: params[:name])
    redirect_to action: 'index'
  end

  def show
    @peep = Peep.find(params[:id])
  end

  def edit
    @peep = Peep.find(params[:id])
  end

  def update
    @peep = Peep.find(params[:id])
    if @peep.update(content: params[:content], name: params[:name])
      flash[:notice] = 'Successfully updated peep!'
      redirect_to action: 'index'
    end
  end

  def destroy
    Peep.destroy(params[:id])
    redirect_to action: 'index'
  end
end
