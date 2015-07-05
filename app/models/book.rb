# -*- encoding : utf-8 -*-
class Book < ActiveRecord::Base
  belongs_to :publisher

  has_many :sales
  has_many :shops, :through => :sales

  attr_protected
end