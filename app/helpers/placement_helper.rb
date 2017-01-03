module PlacementHelper
  def linkify_address(address)
    address.gsub /\s+/, ','
  end

  def placement_description(placement)
    placement.description != '' ? placement.description : 'No description'
  end
end
