module MediaConvertersHelper
  def convert_size(value)
    array = MediaConverter.bandwidths.select{|e| e[1] == value.to_i}

    return array[0][0] if array != []

    return value
  end
end
