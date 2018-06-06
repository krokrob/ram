Memory.destroy_all
Contact.destroy_all
User.destroy_all

kevin = User.create(email: 'kevin@ramaccessmemory.com', password: '123456')
anisa = User.create(email: 'anisa@ramaccessmemory.com', password: '123456')

melissa = Contact.create(first_name: 'Mélissa', user: kevin)
bibi = Contact.create(first_name: 'Alba', user: anisa)
mado = Contact.create(first_name: 'Mado', user: kevin)
babi = Contact.create(first_name: 'Babi Luan i bukur', user: anisa)

nd = Memory.create(title: 'Visite du sommet de Notre-Dame',
  address: 'Eglise Notre-Dame, Paris', user: kevin)
nd.tag_list.add('visit', 'culture', 'must see', 'church')
nd.save
MemoryContact.create(contact: melissa, memory: nd)

brutus = Memory.create(title: 'Crêprerie Chez Brutus',
  address: "rue des dames, Paris", user: kevin)
brutus.tag_list.add('food', 'bar', 'restaurant')
brutus.save

boca = Memory.create(title: 'Burrito la Boca Mexa',
  address: '120 rue Oberkampf, Paris', user: kevin)
MemoryContact.create(memory: boca, contact: mado)

watch = Memory.create(title: 'Montre Skanden Anita 159e chez Louis Pion',
  address: 'Les Halles, Paris', user: kevin)
watch.tag_list('gift')
watch.save
MemoryContact.create(contact: mado, memory: watch)


