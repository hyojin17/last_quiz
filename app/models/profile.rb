class Profile < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true, length: { minimum:2, maximum: 30}#길이 최소한글자, 최대 30글자
  VALID_PHONE_NUMBER = /\A010([1-9]{1}[0-9]{3})([0-9]{4})\z/
  #정규 표현식. 그리고 변수이름을 대문자로 써준이유는대문자는 상수를 뜻해서 값이 변하지 않는다를 말해준다.
  validates :mobile, presence: true, format: {with: VALID_PHONE_NUMBER}, uniqueness: true
  #모바일 번호는 있어야 하며(true), 형식은 이러한 정규표현식의 형태를 따라야지만 저장이된다.
  
end
