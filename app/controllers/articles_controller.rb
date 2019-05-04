# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :show, :update, :destroy]

  def index
    # return registed book's aritcles
    # no implements
  end

  def show
    @book = Book.find_by(id: @article.book_id)
  end

  def new
    @article = Article.new
  end

  def create
    article = Article.new(article_params)
    if article.save
      redirect_to books_path, flash: { notice: 'save your article!' }
    else
      render :new
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to books_path
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to books_path
  end

private

  def article_params
    params.require(:article).permit(:title, :body)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
