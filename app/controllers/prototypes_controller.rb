class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_prototype, except: [:index, :new, :create] 
  def index
    @prototypes = Prototype.includes(:user)
    end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
      if @prototype.save
        redirect_to root_path
      else
        render :new
      end
    end

    def show
     @prototype = Prototype.find(params[:id])
     @comment = Comment.new
     @comments = @prototype.comments
    end

    def edit
      redirect_to root_path unless current_user.id == @prototype.user.id
    end

    def update
      if @prototype.update(prototype_params)
        redirect_to prototype_path
      else
        render :edit
      end
    end

    def destroy
      @prototype.destroy
      redirect_to root_path
    end

 private

  def prototype_params
  params.require(:prototype).permit(:title, :image, :catch_copy, :concept).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

end