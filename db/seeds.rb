# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Hardware.delete_all

def get_serial_number()
  rand(99999999).to_s
end

def get_hardware_status()
  if rand(2) == 1
    return true
  else
    return false
  end
end

#APC
  ["BE350G", "BX1200LCD", "BX1300LCD", "BR700G", "BE550G"].each do |a|
    rand(6).times {
      @hardware_status = get_hardware_status()
      Hardware.create(make:"APC", model:a, serial_number:get_serial_number(), hardware_status:@hardware_status)
    }
  end

#Cisco
  ["SR216", "C2924", "C1721", "C3550", "C3500XL", "MB100", "1760", "3640", "WS-C3548-XL", "2650XM", "7200", "MC3800", "DIR-655", "3620"].each do |c|
    rand(12).times {
      @hardware_status = get_hardware_status()
      Hardware.create(make:"Cisco", model:c, serial_number:get_serial_number(), hardware_status:@hardware_status)
    }
  end

#Dell
  ["PowerConnect 2224", "SC 1425", "2850", "400SC", "T110"].each do |d|
    rand(6).times {
      @hardware_status = get_hardware_status()
      Hardware.create(make:"Dell", model:d, serial_number:get_serial_number(), hardware_status:@hardware_status)
    }
  end

#Linksys
  ["SRW224", "WRT54GL", "WRT54GS", "SRW224G4P", "SRW224G4", "WRT600N", "WRT54G", "SRW224P", "SR224", "WRT110"].each do |l|
    rand(12).times {
      @hardware_status = get_hardware_status()
      Hardware.create(make:"Linksys", model:l, serial_number:get_serial_number(), hardware_status:@hardware_status)
    }
  end

#Marvell
  ["003-GP00002", "003-SP1001", "003-SP1001-1"].each do |m|
    rand(8).times {
      @hardware_status = get_hardware_status()
      Hardware.create(make:"Marvell", model:m, serial_number:get_serial_number(), hardware_status:@hardware_status)
    }
  end

#NetGear
  ["FS108P", "FS108", "FS116P", "WGR614", "WNDS3300", "FS108NA", "FS728TP", "FS726TP", "GS108T", "FS105", "GS605", "FS116", "FS116NA", "FS116E"].each do |n|
    rand(6).times {
      @hardware_status = get_hardware_status()
      Hardware.create(make:"NetGear", model:n, serial_number:get_serial_number(), hardware_status:@hardware_status)
    }
  end

#Proxim
  ["5054-R SUR-US", "5054-SA120-14", "5054-SUR-US", "5054-SUR US World", "Tsunami 40400-25", "Tsunami MP-11-R", "Tsunami MP 5014", "Tsunami 5054-SUI-US", "Tsunami 40100-252", "Tsunami 40100-652"].each do |p|
    rand(8).times {
      @hardware_status = get_hardware_status()
      Hardware.create(make:"Proxim", model:p, serial_number:get_serial_number(), hardware_status:@hardware_status)
    }
  end

#Trendnet
  ["TE100-P1P", "TRC-100MSC", "TPE-S44"].each do |t|
    rand(6).times {
      @hardware_status = get_hardware_status()
      Hardware.create(make:"Trendnet", model:t, serial_number:get_serial_number(), hardware_status:@hardware_status)
    }
  end

#Ubiquiti
  ["AM-5G15", "AM-5G20", "AM-5G17", "AM-2G16", "AM-5G16", "NB-5G22 US", "NB-5G22", "NB-5G25"].each do |u|
    rand(8).times {
      @hardware_status = get_hardware_status()
      Hardware.create(make:"Ubiquiti", model:u, serial_number:get_serial_number(), hardware_status:@hardware_status)
    }
  end