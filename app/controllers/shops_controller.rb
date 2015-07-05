# -*- encoding : utf-8 -*-
class ShopsController < ApplicationController
  respond_to :html, :json

  def index
    @shops = Shop.find :all, order: 'name asc'
    if params[:publisher].present?
      @publisher = Publisher.find params[:publisher]
      @shops = Shop.joins(:books).where({'books.publisher_id': params[:publisher] }).uniq
        .map{|shop|{
          id: shop.id, 
          name: shop.name,
          books_sold_count: shop.count_of_sold(params[:publisher]),
          books_in_stock: shop.books.where(publisher_id: params[:publisher])
          .map{|book|{
            id: book.id,
            title: book.title,
            copies_in_stock: shop.copies('stock', book.id)
          }}
        }}
        .sort_by{|shop| shop[:books_sold_count]}.reverse
    end
    respond_with @shops do |format|
      format.html
      format.json {render json: @books = {'shops': @shops} }
    end
  end

  def show
    @shop = Shop.find params[:id]
    @books = @shop.books.find :all, order: 'title asc'
    @books = @shop.books.find_all_by_id(params[:books].map{|key,id| id.to_i}) if params[:books].present?
    respond_with @books do |format|
      format.html
      format.json
    end
  end

  def new
    @shop = Shop.new
  end

  def edit
    @shop = Shop.find params[:id]
    @books = Book.find :all
  end

  def create
    @shop = Shop.new params[:shop]
    @shop.save
    respond_with [:shops]
  end

  def update
    @shop = Shop.find params[:id]
    @shop.books.delete_all
    params[:book].each do |key, book_id|
      book = Book.find book_id
      @shop.books << book
      @shop.copies 'stock', book_id, params[:stock][key]
      @shop.copies 'sold', book_id, params[:sold][key]
    end
    respond_with @shop
  end

  def destroy
    @shop = Shop.find params[:id]
    @shop.destroy
    respond_with @shop
  end
end
