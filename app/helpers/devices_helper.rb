module DevicesHelper
	def rows(device)
      device.channels.length + 1
    end
end
