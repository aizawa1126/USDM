# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Role.create(id: 1, name: 'administrator')
Role.create(id: 2, name: 'customer')
Role.create(id: 3, name: 'designer')
Role.create(id: 4, name: 'tester')
Role.create(id: 5, name: 'guest')

Operation.create(id: 1, name: 'user create')
Operation.create(id: 2, name: 'member create')
Operation.create(id: 3, name: 'read')
Operation.create(id: 4, name: 'write')
Operation.create(id: 5, name: 'customor review check')
Operation.create(id: 6, name: 'design review check')
Operation.create(id: 7, name: 'tester review check')

Permission.create(role_id: 1, operation_id: 1)
Permission.create(role_id: 1, operation_id: 2)
Permission.create(role_id: 1, operation_id: 3)
Permission.create(role_id: 1, operation_id: 4)

Permission.create(role_id: 2, operation_id: 3)
Permission.create(role_id: 2, operation_id: 4)
Permission.create(role_id: 2, operation_id: 5)

Permission.create(role_id: 3, operation_id: 3)
Permission.create(role_id: 3, operation_id: 4)
Permission.create(role_id: 3, operation_id: 6)

Permission.create(role_id: 4, operation_id: 3)
Permission.create(role_id: 4, operation_id: 7)

Permission.create(role_id: 5, operation_id: 3)

User.create(id: 1, name: 'admin', email: 'admin@sample.com', password: 'administrator', password_confirmation: 'administrator', admin: true)
