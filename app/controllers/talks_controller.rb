class TalksController < ApplicationController
  before_action :set_talk, only: [:show, :edit, :update, :destroy]
  
  def index
    @talks = Talk.all
  end
  
  def new
    if params[:back]
      @talk = Talk.new(talk_params)
    else
      @talk = Talk.new
    end
  end
  
  def create
    @talk = Talk.new(talk_params)
    if @talk.save
      redirect_to talks_path, notice: "つぶやきを作成しました。"
    else
      render 'new'
    end
  end
  
  def show
    @talk = Talk.find(params[:id])
  end
  
  def edit
    @talk = Talk.find(params[:id])
  end
  
  def update
    @talk = Talk.find(params[:id])
    if @talk.update(talk_params)
      redirect_to talks_path, notice: "つぶやきを編集しました。"
    else
      render 'edit'
    end
  end
  
  def destroy
    @talk.destroy
    redirect_to talks_path, notice: "つぶやきを削除しました。"
  end
  
  def confirm
    @talk = Talk.new(talk_params)
    render :new if @talk.invalid?
  end
  
  private
  
  def talk_params
    params.require(:talk).permit(:content)
  end
  
  def set_talk
    @talk = Talk.find(params[:id])
  end

end
