Device.delete_all
title = ['Датчик избыточного давления', 'Напоромер мембранный показывающий', 'Датчик разряжения', 'Прибор регистрирующий', 'Преобразователь разности давления']
location = [9,5,8]
status = [2,3,15,17,19,23,24]
device_type = ['Метран-43-ДИ','ДИСК-250', 'Сапфир-22-ДИ', '506T', 'ТмМП-52', 'ДТНМП-100-М1']
form_of_mr = ['П','К','МПИ']
Device.transaction do
	(1..50).each do |i|
		Device.create( 
			:uniq_number_in_ASOMI => "#{i}", 
			:title => title[rand(title.length)], 
			:device_type => device_type[rand(device_type.length)], 
			:form_of_mr => form_of_mr[rand(form_of_mr.length)], 
			:inventory_number => rand(1000), 
			:serial_number => rand(25000),  
			:mr_unit => rand(5), 
			:location_id => random_location = location[rand(location.length)],
			:status_id => Location.find(random_location).statuses[rand(Location.find(random_location).statuses.length)].id, 
			:prev_mr_date => Date.today - rand(150).days,
			:next_mr_date => (Date.today + rand(150).days ), 
			:replace_param => rand(5))
	end
end