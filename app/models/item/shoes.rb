class Item::Shoes < Item
  attr_reader :holly

  def initialize
    super
    @holly = false
  end

  def id
    if @holly
      :holly_shoes
    else
      :holey_shoes
    end
  end


end
