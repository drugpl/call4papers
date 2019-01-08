class Admin::PapersController < Admin::AdminController
  def index
    @papers = Paper.with_upvotes.all
  end

  def show
    @paper = Paper.find(params[:id])
    @user = @paper.user
  end

  def upvote
    paper = Paper.find(params[:id])
    current_user.give_upvote!(paper)
    redirect_to admin_paper_path(paper)
  end

  def downvote
    paper = Paper.find(params[:id])
    current_user.take_upvote!(paper)
    redirect_to admin_paper_path(paper)
  end
end
