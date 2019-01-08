class PapersController < ApplicationController
  skip_before_action :authenticate, only: :show
  before_action :set_paper, only: [:show, :edit, :update, :destroy]

  def index
    @papers = current_user.papers.order("created_at DESC").all
  end

  def show
  end

  def new
    @paper = current_user.papers.new
  end

  def edit
  end

  def create
    @paper = current_user.papers.new(paper_params)

    if @paper.save
      notify_excited_organizers
      redirect_to @paper, notice: "Great job! You've successfully propsed a paper for wroclove.rb"
    else
      render :new
    end
  end

  def update
    if @paper.update_attributes(paper_params)
      redirect_to @paper, notice: "Well done! Your proposal has been updated."
    else
      render :edit
    end
  end

  def destroy
    @paper.destroy

    redirect_to papers_url
  end

  protected

  def notify_excited_organizers
    # PapersMailer.created(@paper.title, paper_url(@paper)).deliver
  end

  def paper_params
    params.require(:paper).permit(:title, :public_description, :private_description)
  end

  def set_paper
    @paper = current_user.papers.find(params[:id])
  end
end
