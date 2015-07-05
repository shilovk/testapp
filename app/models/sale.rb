# -*- encoding : utf-8 -*-
class Sale < ActiveRecord::Base
  belongs_to :book
  belongs_to :shop

  attr_protected
end