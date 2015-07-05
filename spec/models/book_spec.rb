require 'rails_helper'

describe Book do
  
  before :all do
    @publisher = FactoryGirl.create :publisher
    @book = FactoryGirl.create :book
    @book.publisher_id = @publisher.id
    @book.save
  end

  it "take publisher name of the book" do
    @book.publisher.name.should == "Pushkin"
  end

end