# -*- encoding : utf-8 -*-
class Shop < ActiveRecord::Base
  has_many :sales
  has_many :books, :through => :sales

  attr_protected

  def have_book?(book)
    self.books.include? book
  end

  def copies(what, book_id, value=nil)
    book = self.sales.where(book_id: book_id).first
    if book.present?
      unless value.nil?
        what == 'stock' ? book.copies_in_stock = value : book.copies_sold = value
        book.save
      end
      return what == 'stock' ? book.copies_in_stock : book.copies_sold
    else
      return 0
    end
  end

  def count_of_sold(publisher_id)
    self.books.where(publisher_id: publisher_id).inject(0){|result, book| result+=self.copies('sold', book.id)}
  end
end