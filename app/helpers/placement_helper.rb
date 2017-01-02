module PlacementHelper
  def linkify_address(placement)
    placement.address.gsub /\s+/, ','
  end
end
