class NoticesController < ApplicationController
  
  before_action :administrator, {only: [:new, :create, :edit, :update]}

  def index
    @notice = Notice.all
  end

  def new
    @notice = Notice.new
  end

  def create
    @notice = Notice.new(
      title: params[:title],
      content: params[:content]
    )

    if @notice.save
      flash[:notice] = "お知らせを投稿しました。"
      redirect_to("/")
    else
      @notice.title = params[:title]
      @notice.content = params[:content]
      render("notice/new")
    end
  end

  def edit
    @notice = Notice.find_by(id: params[:id])
  end

  def update
    @notice = Notice.find_by(id: params[:id])
    @notice.title = params[:title]
    @notice.content = params[:content]

    if @notice.save
      flash[:notice] = "お知らせを更新しました。"
      redirect_to("/")
    else
      render("notice/new")
    end
  end

  def show
    @notice = Notice.find_by(id: params[:id])
  end

  def destroy
    @notice = Notice.find_by(id: params[:id])
    @notice.destroy
    flash[:notice] = "お知らせを削除しました。"
    redirect_to("/")
  end
end
