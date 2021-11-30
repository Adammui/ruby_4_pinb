r1 = Role.create({ name: 'Regular', description: 'Can read items' })
r2 = Role.create({ name: 'Moderator', description: 'Can read and create items. Can update and destroy any comment of adv' })
r3 = Role.create({ name: 'Admin', description: 'Can perform any CRUD operation on any resource' })

u1 = User.create({ full_name: 'fae', email: 'faewrr@gmail.com', password: '123456', password_confirmation: '123456', role_id: r3.id })

i1 = Advertisement.create({ text: 'Hello this is test text idk what to write Hello this is test text idk what to writeHello this is test text idk what to write Hello this is test text idk what to write Hello this is test text idk what to write Hello this is test text idk what to write Hello this is test text idk what to write Hello this is test text idk what to write',
                            user_id: u1.id })