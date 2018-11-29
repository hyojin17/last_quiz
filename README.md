*0:데이터 베이스 모델링과 Bootstrap설정*

모델링: 어떤 테이블들이 어떻게 관계를 맺게 할것인지 구상하는 것.

레일즈에는 개발, 테스트, 배포 이 세가지 환경이있다.

gem :production do
	gem 'pg'
end추가

squlite 3이동

gem bootstrap검색
젬추가

app/assets/stylesheets
new파일 추가. custom.scss만들기
@import "bootstrap";코드넣기

app/assets/javascript
어플리케이션ja에
//= require jquery3
//= require popper
//= require bootstrap-sprockets
추가.

rails g controller Articles index

root지정
root 'articles#index'

view/layouts/application.html에

<div class="container">
  <%= yield %>
</div>
코드 설정



<1: Devise User와 추가 정보를 위한 Prfvile컨트롤러>
rdbms: 관계형 데이터베이스

rails g devise:install
rails g devise User
rails g model Profile name mobile address birth:date user:belongs_to
user model에 has_one :profile이라고 적어준다.
(1:1관계이다.)

rails db:migrate
(rake db:migrate)

rails c
>u=User.new
>u.email='neo@likelion.net'
>u.password='123123'
>u.save

>p=Profile.new
>p.user = u
(user 자체에 u를 넣는다.)
[8] pry(main)> p.name = '최효진'
=> "최효진"
[9] pry(main)> p.mobile = '01023435'
=> "01023435"
[10] pry(main)> p.address = '서울특별시'
=> "서울특별시"
[11] pry(main)> p.birth = Date.new(2015, 01, 02)
=> Fri, 02 Jan 2015
[12] pry(main)> Date.new(1999, 01, 22)
=> Fri, 22 Jan 1999
[13] pry(main)> date = Date.new(1999, 01, 22)                        
=> Fri, 22 Jan 1999
[14] pry(main)> date.class
=> Date
[15] pry(main)> p
=> #<Profile:0x00000002a97d90
 id: nil,
 name: "최효진",
 mobile: "01023435",
 address: "서울특별시",
 birth: Fri, 02 Jan 2015,
 user_id: 1,
 created_at: nil,
 updated_at: nil>
[16] pry(main)> p.save
...
[17] pry(main)> u.profile
=> #<Profile:0x00000002a97d90
 id: 1,
 name: "최효진",
 mobile: "01023435",
 address: "서울특별시",
 birth: Fri, 02 Jan 2015,
 user_id: 1,
 created_at: Mon, 19 Nov 2018 11:20:06 UTC +00:00,
 updated_at: Mon, 19 Nov 2018 11:20:06 UTC +00:00>
[18] pry(main)> u.profile.name
=> "최효진"
[19] pry(main)> u.profile.birth
=> Fri, 02 Jan 2015
[20] pry(main)> u.profile.address
=> "서울특별시"

[21] pry(main)> u =User.new
=> #<User id: nil, email: "", created_at: nil, updated_at: nil>
[22] pry(main)> u.email = 'sdf'
=> "sdf"
[23] pry(main)> u.save
   (0.2ms)  begin transaction
  User Exists (0.3ms)  SELECT  1 AS one FROM "users" WHERE "users"."email" = 'sdf' LIMIT 1
   (0.1ms)  rollback transaction#저장되지 않은것.
=> false#올바르지 않음
[24] pry(main)> u.save.class#확인하기
   (0.2ms)  begin transaction
  User Exists (0.2ms)  SELECT  1 AS one FROM "users" WHERE "users"."email" = 'sdf' LIMIT 1
   (0.1ms)  rollback transaction
=> FalseClass
[25] pry(main)> u.errors.full_messages
=> ["Email is invalid", "Password can't be blank"]

profile.rb에 이렇게 작성하고
validates :name, presence: true, length: { minimum:1, maximum: 30}#길이 최소한글자, 최대 30글자
코솔 끄고 다시 킨다음에

hyojin2018:~/workspace $ rails c
Running via Spring preloader in process 16272
Loading development environment (Rails 4.2.5)
[1] pry(main)> u=User.first
  User Load (0.7ms)  SELECT  "users".* FROM "users"  ORDER BY "users"."id" ASC LIMIT 1
=> #<User id: 1, email: "neo@likelion.net", created_at: "2018-11-19 11:15:05", updated_at: "2018-11-19 11:15:05">
[2] pry(main)> p=Profile.first
  Profile Load (0.2ms)  SELECT  "profiles".* FROM "profiles"  ORDER BY "profiles"."id" ASC LIMIT 1
=> #<Profile:0x000000036ccfc0
 id: 1,
 name: "최효진",
 mobile: "01023435",
 address: "서울특별시",
 birth: Fri, 02 Jan 2015,
 user_id: 1,
 created_at: Mon, 19 Nov 2018 11:20:06 UTC +00:00,
 updated_at: Mon, 19 Nov 2018 11:20:06 UTC +00:00>
[3] pry(main)> p.name = 'a'
=> "a"
[4] pry(main)> p.name = nil
=> nil
[5] pry(main)> p
=> #<Profile:0x000000036ccfc0
 id: 1,
 name: nil,
 mobile: "01023435",
 address: "서울특별시",
 birth: Fri, 02 Jan 2015,
 user_id: 1,
 created_at: Mon, 19 Nov 2018 11:20:06 UTC +00:00,
 updated_at: Mon, 19 Nov 2018 11:20:06 UTC +00:00>
[6] pry(main)> p.save
   (0.2ms)  begin transaction
   (0.1ms)  rollback transaction
=> false
[7] pry(main)> p.valid?#이거 저장해도되니?라고 묻는 것.
=> false
[8] pry(main)> p,vaild?
SyntaxError: unexpected '\n', expecting &. or :: or '[' or '.'
[8] pry(main)> p.erros.full_messages
NoMethodError: undefined method `erros' for #<Profile:0x000000036ccfc0>
Did you mean?  errors
from /usr/local/rvm/gems/ruby-2.3.4/gems/activemodel-4.2.5/lib/active_model/attribute_methods.rb:433:in `method_missing'
[9] pry(main)> p.errors.full_messages#안되는 이유를 풀메세지로 알려준다.
=> ["Name can't be blank",
 "Name is too short (minimum is 1 character)"]

*유효성 검사(validation)은 모델이 써주는 것이다.


---------------
rails g devise:views
#우리가 현재 가지고 있는 뷰들을 나오게 해준다.

rails d devise:views

rails devise views bootstrap 구글에 검색

rails g devise:views:bootstrap_templates

application>storage>cookie

rails g controller profiles

rails c
@profile = User.first.profile

u=User.create

Profile.all
----------

4: 게시글을 위한 Article CRUD 모델과 컨트롤러

rails g model Article title content:text user:belongs_to

rails g controller Articles

rails text area editor
tinymce
https://github.com/spohlenz/tinymce-rails


<%=post.user.profile.name %>

100개의 글 콘솔에서 만들기
Article.create title: "#{i}번 글", content: "#{i} * #{i} = #{ i * i }", user: User.find(2)

100.times do |i|

gem kaminari

---------------------

5

----

7: Like(좋아요) 모델-컨트롤러

rails g model like user:belongs_to article:belongs_to

rails g controller Likes
likes는 뷰파일이 전혀 필요없다.

8
rails g model Song title lyric:text cover

rails g controller Songs new index show edit
gem carrierwave
(aws)
sudo yum install ImageMagick
(c9)
sudo apt-get update
sudo apt-get install imagemagick

rails generate uploader Cover
rails c
@song.valid?
@song.errors.full_messages

13.
rails g model Participate artist:belongs_to song:belongs_to

주지마, 로꼬 participate로 나온다.
artist/4으로 가면 로꼬사진밑에 썸네일로 주지마 커버사진이 함꼐 나와야 함.(나는 적용안됨)

14

rails g migration add_role_to_profiles role:string

15

rails g controller Jukebox index

화면 확인해서 제대로 곡 넣어주기

<!--<%# if ['admin', 'editor'].include? current_user.profile.role %>-->

16

rails g controller Participates new edit
주크박스 마마무랑 사진 정렬해주기

17

gem acts_as_commentable
검색
comentable: 댓글을 달 수 있는 놈의
commentable_type: 
rails g controller Comments

rails c
s = Song.first
c = s.comments.new
 u = User.first
c
c.user = u
c.save
s.comments
------------

17
@artist = Artist.last
@artist.id
@artist.class

polymopic하다 -> 다형성

18
acts as votable
acts as follwer

19
act as follower검색
rails generate acts_as_follower
rails g controller follows

1번 유저로 들어가보기
