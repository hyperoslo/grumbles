class Wizard < BaseEntity
  attr_accessor :in_shoes

  def id
    :me
  end

  alias_method :current_location, :parent

  def describe
    <<-HTML
      I am Grumbles the lame Wizard! *flexes*

      I’m currently in the <strong>#{current_location.id}</strong>.
    HTML
  end

  def search
    "I’m currently carrying:\n\n#{list_entities}"
  end

  def references(id)
    return if id.nil?

    id = id.to_sym

    # Current location
    return current_location if current_location.is? id

    # Entities in the current location
    entity = current_location.find id
    return entity if entity

    # Inventory items
    item = find id
    return item if item

    # Location connections
    if current_location.connects_to? id
      game.find id
    end
  end

end
