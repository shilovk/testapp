require 'rails_helper'

describe Publisher do
  
  before :all do
    @publisher = FactoryGirl.create :publisher
    @book = FactoryGirl.create :book
    @publisher.books << @book
    @publisher.save
  end

  it "take title of the first publisher's book" do
    @publisher.books.first.title.should == "Metel"
  end

end