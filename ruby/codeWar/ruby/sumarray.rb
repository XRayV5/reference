


# TODO: complete this class

class PaginationHelper

  # The constructor takes in an array of items and a integer indicating how many
  # items fit within a single page
  def initialize(collection, items_per_page)
    @items = collection
    @items_per_page = items_per_page
  end

  # returns the number of items within the entire collection
  def item_count
    @items.size
  end

  # returns the number of pages
  def page_count
    (@items.size.to_f/@items_per_page.to_f).ceil
  end

  # returns the number of items on the current page. page_index is zero based.
  # this method should return -1 for page_index values that are out of range

  def page_item_count(page_index)
    if page_index >= 0 && page_index < page_count-1
      return @items_per_page
    elsif page_index == page_count-1
      return @items.size % @items_per_page == 0 ? @items.size % @items_per_page : @items.size % @items_per_page
    else
      return -1
    end
  end

  # determines what page an item is on. Zero based indexes.
  # this method should return -1 for item_index values that are out of range
  def page_index(item_index)
    p validindex(item_index)
    validindex(item_index) ? ((item_index + 1).to_f / @items_per_page.to_f).ceil - 1 : -1
  end

  def validindex(item_index)
    item_index < @items.size && item_index >= 0
  end

end


helper = PaginationHelper.new(['a','b','c','d','e','f'], 4)
p helper.page_count # should == 2
p helper.item_count # should == 6
p helper.page_item_count(0)  # should == 4
p helper.page_item_count(1) # last page - should == 2
p helper.page_item_count(2) # should == -1 since the page is invalid

# page_ndex takes an item index and returns the page that it belongs on
p helper.page_index(5) # should == 1 (zero based index)
p helper.page_index(2) # should == 0
p helper.page_index(20) # should == -1
p helper.page_index(-10) # should == -1 because negative indexes are invalid
