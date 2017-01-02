module PlacementHelper
  def linkify_address(address)
    address.gsub /\s+/, ','
  end
end
