class LikesController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    like = current_user.likes.build(article_id: params[:article_id])
    like.save
    respond_to do |format|
      format.html {redirect_to @article}
      format.js
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    like = Like.find_by(article_id: params[:article_id], user_id: current_user.id)
    like.destroy
    respond_to do |format|
      format.html { redirect_to @article }
      format.js
    end
  end

end
