Memory.destroy_all
Contact.destroy_all
User.destroy_all

kevin = User.create(email: 'kevin@ramaccessmemory.com', password: '123456')
anisa = User.create(email: 'anisa@ramaccessmemory.com', password: '123456')

melissa = Contact.create(first_name: 'Mélissa', user: kevin)
bibi = Contact.create(first_name: 'Alba', user: anisa)
mado = Contact.create(first_name: 'Mado', user: kevin)
babi = Contact.create(first_name: 'Babi Luan i bukur', user: anisa)

nd = Memory.new(
  title: 'Visite du sommet de Notre-Dame',
  address: 'Eglise Notre-Dame, Paris',
)
