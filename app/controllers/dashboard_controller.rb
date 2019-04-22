class DashboardController < ApplicationController
  def index
    @src = File.basename(Dir["app/assets/images/*.gif"].sample)
    @comments = Comment.last(20).reverse
  end

  def create_comment
    Comment.create(comment_params)
    redirect_to '/'
  end

  private

  def comment_params
    params.permit(:name, :body)
  end
end