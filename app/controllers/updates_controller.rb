class UpdatesController < ApplicationController
  before_action :find_update_by_id, only: [:show, :edit, :delete, :update, :destroy]

  def index
    @updates = Update.all;
  end

  def show
  end

  def new
    @update = Update.new
  end

  def create
    update = Update.new(update_params);
    update.save;
    redirect_to updates_path;
  end

  def edit
  end

  def update
    @update.update(update_params);
    redirect_to update_path(@update);
  end

  def delete
  end

  def destroy
    @update.destroy;
    redirect_to root_path;
  end

  private
  def update_params
    params.require(:update).permit(:title, :summary);
  end

  def find_update_by_id
    @update = Update.find(params[:id]);
  end
end
