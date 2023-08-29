loja = Category.create(name: "Loja")
ponto = Category.create(name: "Ponto Turístico")
artesao = Category.create(name: "Artesão")

master = User.create(name: "ItapasTur", email: "itapastur@gmail.com", password: "1234567890")

endereco_shopping = Address.create(street: "Rua Major Barreto", number: "1451", neighborhood: "Centro")
shopping = Enterprise.new(name: "Shopping Pães", description: "Padaria, Pizzaria e Mercantil", cellphone: "(85) 99281-4111")
shopping.user = master
shopping.address = endereco_shopping
shopping.category = loja
shopping.image_one.attach(io: File.open('app/assets/images/shopping1.png'), filename: "shopping1.png") 
shopping.image_two.attach(io: File.open('app/assets/images/shopping2.jpg'), filename: "shopping2.jpg")
shopping.image_three.attach(io: File.open('app/assets/images/shopping3.jpg'), filename: "shopping3.jpg")
shopping.save!

endereco_francis = Address.create(street: "Rua Raimundo Felício", number: "120", neighborhood: "Esmerino Gomes")
francis = Enterprise.new(name: "Francys Ice Cream", description: "Ingredientes naturais, por uma vida mais feliz e com muito recheio!", cellphone: "(85) 99209-6571")
francis.user = master
francis.address = endereco_francis
francis.category = loja
francis.image_one.attach(io: File.open('app/assets/images/francis1.jpeg'), filename: "francis1.jpeg") 
francis.image_two.attach(io: File.open('app/assets/images/francis2.png'), filename: "francis2.png")
francis.image_three.attach(io: File.open('app/assets/images/francis3.png'), filename: "francis3.png")
francis.save!

endereco_marcia = Address.create(street: "Rua Major Barreto", number: "1591", neighborhood: "Centro")
marcia = Enterprise.new(name: "MM Variedades", description: "Moda Adulta, Infantil e infanto juvenil", cellphone: "(85) 99143-9169")
marcia.user = master
marcia.address = endereco_marcia
marcia.category = loja
marcia.image_one.attach(io: File.open('app/assets/images/marcia1.png'), filename: "marcia1.png")
marcia.image_two.attach(io: File.open('app/assets/images/marcia2.png'), filename: "marcia2.png")
marcia.image_three.attach(io: File.open('app/assets/images/marcia3.png'), filename: "marcia3.png")
marcia.save!

endereco_americanas = Address.create(street: "Rua Manoel Luís da Rocha", number: "77", neighborhood: "Centro")
americanas = Enterprise.new(name: "Americanas", description: "De iPhone a creatina, de notebook a air fryer, de PS5 a barra de chocolate, aqui tem essas e muitas outras ofertas pra você. Vem na Americanas!")
americanas.user = master
americanas.address = endereco_americanas
americanas.category = loja
americanas.image_one.attach(io: File.open('app/assets/images/americanas1.png'), filename: "americanas1.png")
americanas.image_two.attach(io: File.open('app/assets/images/americanas2.png'), filename: "americanas2.png")
americanas.image_three.attach(io: File.open('app/assets/images/americanas3.png'), filename: "americanas3.png")
americanas.save!
