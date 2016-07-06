
User.create(name: 'Jorge', email: 'jorgeperis@gmail.com')
User.create(name: 'Laura', email: 'laura@gmail.com')
User.create(name: 'Juan Vicente', email: 'juanvi@gmail.com')
User.create(name: 'Maria Dolores', email: 'madolo@gmail.com')
User.create(name: 'Nera', email: 'nera@gmail.com')
User.create(name: 'Monica', email: 'monica@gmail.com')
User.create(name: 'Javi', email: 'javi@gmail.com')
User.create(name: 'Mireia', email: 'mireia@gmail.com')
User.create(name: 'Dolores', email: 'dolores@gmail.com')
User.create(name: 'Andres', email: 'andres@gmail.com')
User.create(name: 'Elena', email: 'elena@gmail.com')

nera = User.find_by(name: 'Nera')
elena = User.find_by(name: 'Elena')
javi = User.find_by(name: 'Javi')

Product.create(title: 'Rascador', description: 'Rascador de gatos', deadline: "2016-07-06 20:09:59", user: nera)
Product.create(title: 'Television', description: 'TV 40"', deadline: "2016-07-07 10:09:59", user: elena)
Product.create(title: 'Moto', description: '125cc', deadline: "2016-07-07 09:09:59", user: javi)

rascador = Product.find_by(title: 'Rascador')
television = Product.find_by(title: 'Television')
moto = Product.find_by(title: 'Moto')

Bid.create(amount: 50, user: javi, product: rascador)
Bid.create(amount: 60, user: nera, product: rascador)
Bid.create(amount: 10, user: elena, product: television)
Bid.create(amount: 50, user: javi, product: rascador)
Bid.create(amount: 60, user: nera, product: moto)
Bid.create(amount: 10, user: elena, product: moto)