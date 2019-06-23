# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :show, :update, :destroy]
  before_action :set_book, only: [:show, :new, :create]

  def show
    @comments = @article.comments
    @comment = @article.comments.build
  end

  def new
    @article = Article.new
  end

  def create
    @article = @book.articles.build(article_params)
    if @article.save
      redirect_to books_path, notice: t('views.message.create_article')
    else
      render :new
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to books_path, notice: t('views.message.update_article')
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to books_path, alert: t('views.message.del_article')
  end

private

  def article_params
    params.require(:article).permit(:title, :body, :user_id).merge(user_id: current_user.id)
  end

  def set_book
    @book = Book.find(params[:book_id])
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
