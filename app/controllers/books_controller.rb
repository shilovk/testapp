# -*- encoding : utf-8 -*-
class BooksController < ApplicationController
  respond_to :html, :json

  def index
    @books = Book.find(:all, :order => 'name asc')
  end

  def show
    @book = Book.find params[:id]
    @publisher = Publisher.find params[:publisher_id]
  end

  def new
    @book = Book.new
    @publisher = Publisher.find params[:publisher_id]
  end

  def edit
    @book = Book.find params[:id]
    @publisher = Publisher.find params[:publisher_id]
  end

  def create
    @book = Book.new params[:book]
    @publisher = Publisher.find params[:publisher_id]
    @book.publisher = @publisher
    @book.save
    respond_with @publisher
  end

  def update
    @book = Book.find params[:id]
    @publisher = Publisher.find params[:publisher_id]
    @book.update_attributes params[:book]
    respond_with @publisher
  end

  def destroy
    @book = Book.find params[:id]
    @publisher = @book.publisher
    @book.destroy
    respond_with @publisher
  end
end
