# -*- encoding : utf-8 -*-
class Publisher < ActiveRecord::Base
  has_many :books

  attr_protected
end