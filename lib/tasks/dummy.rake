#encoding: utf-8
namespace :db do
    desc "To fill categorie table"
    task dummy: :environment do
    	array = ["Женская мода",
       "Мужская мода",
       "Для дома и офиса", 
       "Электроника", 
       "Компьютеры и софт",
   	   "Книги", 
   	   "Подарки", 
   	   "Детский мир", 
   	   "Авто и мото", 
   	   "Домашние питомцы", 
   	   "Красота и здоровье", 
   	   "Спорт и активный отдых", 
   	   "Handmade", 
   	   "Бытовая техника", 
   	   "Гаджеты", 
   	   "Музыка видео", 
   	   "Настольные игры, пазлы", 
   	   "Игры и приставки", 
   	   "Искусство",
   	   "Прочее"]
   	   unless Category.exists?
   	     array.each do |title|
   	   	   Category.create!(title: title)
   	     end
   	   end
    end
  end