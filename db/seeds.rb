
batcat = Warrior.create(name: "Batcat", intro: "A billionaire cat with bat wings...", life_points: 200, strength: 7)
batcat.avatar.attach(io: File.open('app/assets/images/batcat.jpg'), filename: 'batcat.jpg')

supercat = Warrior.create(name: "Supercat", intro: "Some say his strength comes from an other galaxy, who will find his weakness?", life_points: 180, strength: 8)
supercat.avatar.attach(io: File.open('app/assets/images/supercat.jpg'), filename: 'supercat.jpg')

ladycat = Warrior.create(name: "Ladycat", intro: "Don't trust her polished claws!", life_points: 170, strength: 10)
ladycat.avatar.attach(io: File.open('app/assets/images/pinkcat.jpg'), filename: 'pinkcat.jpg')

banecat = Warrior.create(name: "Banecat", intro: "Gotham is yours!", life_points: 170, strength: 10)
banecat.avatar.attach(io: File.open('app/assets/images/banecat.jpg'), filename: 'banecat.jpg')

Accessory.create(category: "none", name: "None", effect: 0)
Accessory.create(category: "weapon", name: "Sword", effect: 2)
Accessory.create(category: "weapon", name: "Metallic claws", effect: 4)
Accessory.create(category: "shield", name: "Wooden shield", effect: 20)
Accessory.create(category: "shield", name: "Steel shield", effect: 40)
