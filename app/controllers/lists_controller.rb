class ListsController < ApplicationController
  before_action :set_list, only: :show

  def index
    @lists = List.all
  end

  def show
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_param)

    if @list.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_param
    params.require(:list).permit(:name)
  end
end
