require 'rails_helper'

describe ShopsController do
  
  before :all do
    @shop = FactoryGirl.create :shop    
  end

  it "redirects to shops index page after destroy of shop" do
    delete :destroy, id: @shop.id
  end

end