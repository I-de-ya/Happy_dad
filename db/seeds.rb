# coding: utf-8
statuses = Status.create([{title: 'на склад ремонта ОПУ-2'},{title: 'на склад резерва ОПУ-2'},{title: 'на вывод из консервации'},{title: 'в консервации'},{title: 'заявлено в консервацию'},{title: 'в ремонт'},{title: 'на поверку'},{title: 'на калибровку'},{title: 'непригодно'},{title: 'в поверке'},{title: 'в калибровке'},{title: 'готово к выдаче в эксплуатацию'},{title: 'устранение претензии'},{title: 'горячий резерв'},{title: 'претензия к ПРУ'},{title: 'возвращено подрядчиком'},{title: 'на склад резерва ГГС'},{title: 'на позицию'},{title: 'заявлено на списание'},{title: 'списано'},{title: 'на склад ремонта ГГС'},{title: 'требует замены вне графика'},{title: 'в эксплуатации'},{title: 'требует замены по графику'},{title: 'принято подрядчиком'}])
locations = Location.create([{title: 'Склад МТР', statuses: [statuses[0],statuses[1]]},{title: 'Склад консервации', statuses: [statuses[2],statuses[3]]},{title: 'Склад ремонта ОПУ-2', statuses: [statuses[4],statuses[5],statuses[6],statuses[7],statuses[8]]},{title: 'ПРУ', statuses: [statuses[9],statuses[10],statuses[11],statuses[8],statuses[12]]},{title: 'Склад резерва ОПУ-2', statuses: [statuses[0],statuses[13],statuses[14],statuses[15],statuses[16],statuses[17]]},{title: 'Склад ремонта ГГС', statuses: [statuses[0],statuses[5],statuses[6],statuses[7]]},{title: 'Склад списания', statuses: [statuses[18],statuses[19]]},{title: 'Склад резерва ГГС', statuses: [statuses[13],statuses[14],statuses[15],statuses[17],statuses[20]]},{title: 'Место автоматизации', statuses: [statuses[0],statuses[1],statuses[16],statuses[20],statuses[21],statuses[22],statuses[23]]},{title: 'Подрядчик', statuses: [statuses[24]]}])

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
