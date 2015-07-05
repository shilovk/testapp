# -*- encoding : utf-8 -*-
class PublishersController < ApplicationController
  respond_to :html, :json

  def index
    @publishers = Publisher.find(:all, :order => 'name asc')
  end

  def show
    @publisher = Publisher.find params[:id]
    @books = @publisher.books
  end

  def new
    @publisher = Publisher.new
  end

  def edit
    @publisher = Publisher.find params[:id]
  end

  def create
    @publisher = Publisher.new params[:publisher]
    @publisher.save
    respond_with @publisher
  end

  def update
    @publisher = Publisher.find params[:id]
    @publisher.update_attributes params[:publisher]
    respond_with @publisher
  end

  def destroy
    @publisher = Publisher.find params[:id]
    @publisher.destroy
    respond_with @publisher
  end
end
