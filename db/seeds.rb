admin = User.create! :email => 'testadmin@admin.com', :password => 'testtest', :password_confirmation => 'testtest'
user = User.create! :email => 'testuser@user.ru', :password => 'testtest', :password_confirmation => 'testtest'

Category.create!([
  {name: "Чай", discount_percent: 10, discount_amount: 5, image: "http://zhivinaturalno.ru/upload/iblock/2fb/2fbc44b40ad4e22ea4b82c8da6e60bbd.png"},
  {name: "Кофе", discount_amount: 5, image: "http://s017.radikal.ru/i412/1112/e4/bd44b703c687.png"},
  {name: "Сладости", image: "http://landofart.ru/wp-content/uploads/2012/08/ledentsyi.png?9d7bd4"}
])
OrderStatus.create!([
  {name: "In Progress"},
  {name: "Placed"},
  {name: "Shipped"},
  {name: "Cancelled"}
])
Product.create!([
  {name: "Аргентинское танго", description: "Смесь из лучших сортов китайского чая с лимонным миртом, лимонной травой, цветками ромашки, ягодами рябины, корочками цитрусовых, кусочками апельсина и имбиря. Состав: чай зеленый байховый крупнолистовой (Китай), листья лимонного мирта, ягоды рябины, имбирь, кусочки цедры апельсина, цветки ромашки, лимонная трава, ароматизаторы идентичные натуральным \"Лимон\", \"Имбирь\".", category_id: 1, price: 1730.0, image: "http://rusteaco.ru/upload/resize_cache/iblock/dac/90_180_1/dacac60be933cd8f118a0f22e38672c5.jpg", active: true},
  {name: "Амаретто кофе Арабика", description: "Ароматизированный кофе сорта Арабика марки \"Santa-Fe\" Смесь из отборных сортов свежеобжаренного кофе, ароматизированная экстрактом миндаля.", category_id: 2, price: 1710.0, image: "http://rusteaco.ru/upload/iblock/ce1/ce11874620cb52511c80f40209d0e091.png", active: true},
  {name: "Черная Карта \"Молотый\"", description: "Кофейные зерна высокогорной Арабики, обжаренные специальным методом, придают этому кофе крепость, аромат и приятную кислинку.", category_id: 2, price: 450.0, image: "http://www.vladslon.ru/published/publicdata/BROOMARRUSS/attachments/SC/products_pictures/----gold--100.jpg", active: true},
  {name: "Конфеты \"Choco Pie\"", description: "Choco-Pie — знакомый с детства вкус нежного бисквита, покрытого шоколадом, с уникальной начинкой Marshmallow. Запатентованная технология производства и индивидуальная упаковка позволяет Orion Choco-Pie оставаться мягким и свежим надолго.", category_id: 3, price: 90.55, image: "http://www.choco-pie.ru/images/CP12_R_news.png", active: true},
  {name: "Апельсиновый мусс", description: "Классический зеленый чай с кусочками яблока, плодами шиповника, дольками апельсина, кусочками корня свеклы и цедрой цитрусовых, украшенный соцветиями апельсина, лепестками розы и подсолнечника. И завершающая нотка в чайной композиции - вкус лимона. Состав: чай зеленый байховый крупнолистовой, кусочки яблок плоды шиповника, дольки апельсина, кусочки цедры цитрусовых, кусочки корня свеклы, ароматизатор идентичный натуральному \"Лимон\", лепестки розы, лепестки подсолнечника, соцветия апельсина.", category_id: 1, price: 1430.0, image: "http://rusteaco.ru/upload/resize_cache/iblock/dbe/90_180_1/dbe77d437756c6a95e586b9e64c1b9dc.jpg", active: true},
  {name: "Восточные прянности Арабика Santa-Fe", description: "Ароматизированный кофе сорта Арабика марки \"Santa-Fe\" Ароматизированная смесь из отборных сортов арабики,со вкусом только что испеченного пирога, с яркой ноткой специй (кардамон,корица,имбирь) и кремовым послевкусием.", category_id: 2, price: 1470.0, image: "http://rusteaco.ru/upload/iblock/6ee/6ee0e1b5a3a46f087b62b2d01fe1e3b7.png", active: true},
  {name: "Зеленый Ройбуш \"Красные Фрукты\"", description: "Натуральная смесь из листьев и стеблей кустарникового растения из семейства бобовых (зеленый ройбуш), произрастающего в Южной Африке, с черной смородиной, земляникой, вишней, черникой, с потрясающим ароматом клубники, вишни и черники. Состав: зеленый ройбуш, ягоды черной смородины, ароматизаторы идентичные натуральным \"Земляника\", \"Черника\", ягоды черники, ягоды земляники, ягоды красной смородины.", category_id: 1, price: 1630.0, image: "http://rusteaco.ru/upload/resize_cache/iblock/8bd/90_180_1/8bdc57186f250143693f021a252cdfa6.jpg", active: true},
  {name: "Бейлиз кофе Арабика", description: "Ароматизированный кофе сорта Арабика марки \"Santa-Fe\". Знаменитый ликер Бейлиз прекрасно сочетается с кофе. Основа этого кофе — 100% арабика из Бразилии, Колумбии, Мексики. Ароматизация происходит сразу же после обжарки, что позволяет им пропитаться ароматом и получить кофе наивысшего качества. Один из самых любимых женских кофейных напитков.", category_id: 2, price: 1540.0, image: "http://rusteaco.ru/upload/resize_cache/iblock/7db/90_180_1/7db70d90f608b33bbf76a0ef6f6daafa.jpg", active: true},
  {name: "Greenfield Green Melissa", description: "Индивидуальность натуральной композиции Green Melissa создает гармоничное сочетание зеленого чая и душистых трав – мяты и мелиссы.", category_id: 1, price: 140.0, image: "http://irecommend.ru.q5.r-99.com/sites/default/files/imagecache/200x200/product-images/898/9a897b8565e01bd62c158cd52064d8cc_99.jpg", active: true},
  {name: "Конфеты \"Raffaello\"", description: "РАФФАЭЛЛО – хрустящая кокосовая конфета с цельным миндальным орехом. Конфеты Раффаэлло пользуются постоянным спросом в течение всего года. В летний период высокие потребительские свойства продукта полностью сохраняются, что выгодно отличает Раффаэлло от любых шоколадных конфет.\nРАФФАЭЛЛО – самые известные и любимые конфеты в России, уже ставшие неотъемлемой частью жизни российских потребителей. Такой успех стал возможным благодаря множеству факторов, но прежде всего – благодаря уникальному сочетанию неповторимого вкуса, изысканной  белоснежной упаковки и, конечно, романтического имиджа.", category_id: 3, price: 190.0, image: "http://ru.livrare24.md/wp-content/uploads/2014/09/raffaello.jpg", active: true},
  {name: "Конфеты \"Ferrero Rocher\"", description: "Конфеты Ferrero Rocher появились в Италии в 1982 году. Всего лишь за несколько лет они стали любимым шоколадным лакомством для миллионов людей. В чем же секрет такого успеха? Оригинальный рецепт, непревзойденное качество, мастерство и многолетний опыт создания шоколадных конфет, их элегантная упаковка и яркие рекламные кампании.\nНеподражаемый вкус конфет: отборный цельный лесной орех в окружении молочного шоколада и нежного орехового крема, заключенные в хрустящую вафельную оболочку, покрытую шоколадно-ореховой крошкой гарантирует самые волнующие ощущения. Превосходный вкус в сочетании с безупречной позолоченной упаковкой сделали конфеты Ferrero Rocher знаменитыми.", category_id: 3, price: 750.0, image: "http://thedailyguff.com/wp-content/uploads/2015/02/ferrero_zpsbffb6cd61.jpg", active: true}
])
ProductSale.create!([
  {product_id: 6, sales: 12},
  {product_id: 4, sales: 2},
  {product_id: 5, sales: 6},
  {product_id: 10, sales: 1},
  {product_id: 9, sales: 7},
  {product_id: 8, sales: 0},
  {product_id: 7, sales: 3},
  {product_id: 2, sales: 13},
  {product_id: 3, sales: 6},
  {product_id: 11, sales: 2}
])
Role.create!([
  {name: "Admin"},
  {name: "User"}
])
UserRole.create!([
  {user_id: 1, role_id: 1},
  {user_id: 2, role_id: 2},
  {user_id: 3, role_id: 2},
  {user_id: 1, role_id: 2}
])
