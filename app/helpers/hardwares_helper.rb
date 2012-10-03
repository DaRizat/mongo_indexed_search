module HardwaresHelper

  def map_hardware_status(status)
    if status == true
      return "Active"
    else
      return "Inactive"
    end
  end

end
