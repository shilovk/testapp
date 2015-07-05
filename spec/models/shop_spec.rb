require 'rails_helper'

describe Shop do
  
  before :each do
    @publisher = FactoryGirl.create :publisher
    @book = FactoryGirl.create :book
    @book.publisher_id = @publisher.id
    @book.save
    @shop = FactoryGirl.create :shop
    @shop.books << [@book, @book]
    @book_in_shop = @shop.sales.where(book_id: @book.id).first
    @book_in_shop.copies_in_stock = 10
    @book_in_shop.copies_sold = 25
    @book_in_shop.save
  end

  it "checks the book in the shop" do
    @shop.have_book?(@book).should == true
  end

  it "counts sold number of publisher's books in the shop" do
    @shop.count_of_sold(@publisher.id).should == 50
  end

  describe "When changing stock/sold number of the book in the shop" do

    it "sets and checks stock number" do
      @shop.copies('stock', @book.id, 20)
      @shop.copies('stock', @book.id).should == 20
    end

    it "sets and checks sold number" do
      @shop.copies('sold', @book.id, 20)
      @shop.copies('sold', @book.id).should == 20
    end

  end

end