date =  Date.new(2015, 07, 20)

User.create!(email: 'admin@rapp.com', password: '123123')
Profile.create!(user: User.last, role: 'admin', name: 'admin', address: '서울시', mobile: '01012345432', birth: date)

User.create!(email: 'editor1@rapp.com', password: '123123')
Profile.create!(user: User.last, role: 'editor', name: 'EditorA', address: '서울시', mobile: '01078906544', birth: date)

User.create!(email: 'editor2@rapp.com', password: '123123')
Profile.create!(user: User.last, role: 'editor', name: 'EditorB', address: '서울시', mobile: '01099887766', birth: date)

User.create!(email: 'editor3@rapp.com', password: '123123')
Profile.create!(user: User.last, role: 'editor', name: 'EditorC', address: '서울시', mobile: '01044553366', birth: date)