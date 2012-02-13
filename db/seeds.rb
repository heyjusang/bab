#encoding = UTF-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Restaurant.create(resname: '배터지는파닭(신림점)',phone:'02-877-7982',resinfo:'둘이 먹고도 남을 푸짐한 양에 반하다!!',restype:'중식',tastepoint:5,speedpoint:5,amountpoint:5,servicepoint:5,count:1)
Menu.create([{menuname:'순살후라이드',price:12000,like:0,dislike:0,restaurant_id:1,setmenu:false},{menuname:'순살양념',price:12000,like:0,dislike:0,restaurant_id:1,setmenu:false},{menuname:'순살간장양념',price:12000,like:0,dislike:0,restaurant_id:1,setmenu:false},{menuname:'순살카레양념',price:13000,like:0,dislike:0,restaurant_id:1,setmenu:false},{menuname:'2가지 선택',price:17000,like:0,dislike:0,restaurant_id:1,setmenu:true},{menuname:'3가지 선택',price:27000,like:0,dislike:0,restaurant_id:1,setmenu:true},{menuname:'콜라',price:1500,like:0,dislike:0,restaurant_id:1,setmenu:false},{menuname:'스프라이트',price:2500,like:0,dislike:0,restaurant_id:1,setmenu:false}])
