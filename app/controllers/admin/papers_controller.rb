class Admin::PapersController < Admin::AdminController
  def index
    @papers = Paper.order('selected DESC, created_at DESC').all
  end
end
