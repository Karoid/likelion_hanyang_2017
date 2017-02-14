# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# 반드시 Member password를 바꾸어야 한다
# config/initializers/rails_db 의 password, 여기 admin의 password를 바꿔줘라!
#Major
Major.create(department: "미등록", name:"미등록", id: 0);
Major.create(department: "공과대학", name:"건축학부");
Major.create(department: "공과대학", name:"자원환경공학과");
Major.create(department: "공과대학", name:"유기나노공학과");
Major.create(department: "공과대학", name:"에너지공학과");
Major.create(department: "공과대학", name:"전기·생체공학부");
Major.create(department: "공과대학", name:"전기공학전공");
Major.create(department: "공과대학", name:"생체공학전공");
Major.create(department: "공과대학", name:"건축공학부");
Major.create(department: "공과대학", name:"융합전자공학부");
Major.create(department: "공과대학", name:"기계공학부");
Major.create(department: "공과대학", name:"미래자동차공학과");
Major.create(department: "공과대학", name:"화공생명공학부");
Major.create(department: "공과대학", name:"화학공학과");
Major.create(department: "공과대학", name:"생명공학과");
Major.create(department: "공과대학", name:"건설환경공학과");
Major.create(department: "공과대학", name:"정보시스템학과");
Major.create(department: "공과대학", name:"원자력공학과");
Major.create(department: "공과대학", name:"컴퓨터공학부");
Major.create(department: "공과대학", name:"컴퓨터전공");
Major.create(department: "공과대학", name:"소프트웨어전공");
Major.create(department: "공과대학", name:"도시공학과");
Major.create(department: "공과대학", name:"신소재공학부");
Major.create(department: "공과대학", name:"산업공학과");
Major.create(department: "의과대학", name:"의예과");
Major.create(department: "의과대학", name:"의학과");
Major.create(department: "인문과학대학", name:"국어국문학과");
Major.create(department: "인문과학대학", name:"중어중문학과");
Major.create(department: "인문과학대학", name:"영어영문학과");
Major.create(department: "인문과학대학", name:"독어독문학과");
Major.create(department: "인문과학대학", name:"사학과");
Major.create(department: "인문과학대학", name:"철학과");
Major.create(department: "인문과학대학", name:"수행인문학부");
Major.create(department: "사회과학대학", name:"정치외교학과");
Major.create(department: "사회과학대학", name:"사회학과");
Major.create(department: "사회과학대학", name:"미디어커뮤니케이션학과");
Major.create(department: "사회과학대학", name:"관광학부");
Major.create(department: "자연과학대학", name:"수학과");
Major.create(department: "자연과학대학", name:"물리학과");
Major.create(department: "자연과학대학", name:"화학과");
Major.create(department: "자연과학대학", name:"생명과학과");
Major.create(department: "정책과학대학", name:"정책학과");
Major.create(department: "정책과학대학", name:"행정학과");
Major.create(department: "법과대학", name:"법학과");
Major.create(department: "경제금융대학", name:"경제금융학부");
Major.create(department: "경영대학", name:"경영학부");
Major.create(department: "경영대학", name:"파이낸스경영학과");
Major.create(department: "사범대학", name:"교육학과");
Major.create(department: "사범대학", name:"교육공학과");
Major.create(department: "사범대학", name:"국어교육과");
Major.create(department: "사범대학", name:"영어교육과");
Major.create(department: "사범대학", name:"수학교육과");
Major.create(department: "사범대학", name:"응용미술교육과");
Major.create(department: "생활과학대학", name:"의류학과");
Major.create(department: "생활과학대학", name:"식품영양학과");
Major.create(department: "생활과학대학", name:"실내건축디자인학과");
Major.create(department: "음악대학", name:"성악과");
Major.create(department: "음악대학", name:"작곡과");
Major.create(department: "음악대학", name:"피아노과");
Major.create(department: "음악대학", name:"관현악과");
Major.create(department: "음악대학", name:"국악과");
Major.create(department: "예술·체육대학", name:"체육학과");
Major.create(department: "예술·체육대학", name:"스포츠산업학과");
Major.create(department: "예술·체육대학", name:"연극영화학과");
Major.create(department: "예술·체육대학", name:"관현악과");
Major.create(department: "국제학부", name:"국제학과");
Major.create(department: "간호학부", name:"간호학과");
Major.create(department: "산업융합학부", name:"응용시스템전공");
Major.create(department: "산업융합학부", name:"정보융합전공");
#Member
Member.create(username: "관리자", email: 'admin@likelion.org', password: 'likelion',tel:'01000000000', admin: true, role:2)
#Member.create(username: "정승호", email: 'shj5508@naver.com',senior_number:34, password: 'kk1111',tel:'01000000000', admin: false, role:2)
  #Test Data
=begin
  Member.create(username: "송성국", email: '133@huhs.net',senior_number:33, password: 'kk1111',tel:'01000000000', admin: false, role:0);
  Member.create(username: "송정안", email: '132@huhs.net',senior_number:32, password: 'kk1111',tel:'01000000000', admin: false, role:0);
  Member.create(username: "송태용", email: '131@huhs.net',senior_number:31, password: 'kk1111',tel:'01000000000', admin: false, role:0);
  Member.create(username: "송승훈", email: '130@huhs.net',senior_number:30, password: 'kk1111',tel:'01000000000', admin: false, role:0);
  Member.create(username: "송주성", email: '129@huhs.net',senior_number:29, password: 'kk1111',tel:'01000000000', admin: false, role:0);
  Member.create(username: "송태호", email: '128@huhs.net',senior_number:33, password: 'kk1111',tel:'01000000000', admin: false, role:0);
  Member.create(username: "송고인", email: '127@huhs.net',senior_number:32, password: 'kk1111',tel:'01000000000', admin: false, role:0);
  Member.create(username: "송용석", email: '126@huhs.net',senior_number:31, password: 'kk1111',tel:'01000000000', admin: false, role:0);
  Member.create(username: "송상오", email: '125@huhs.net',senior_number:30, password: 'kk1111',tel:'01000000000', admin: false, role:0);
  Member.create(username: "송성호", email: '124@huhs.net',senior_number:29, password: 'kk1111',tel:'01000000000', admin: false, role:0);
  Member.create(username: "김성국", email: '33@huhs.net',senior_number:33, password: 'kk1111',tel:'01000000000', admin: false, role:1);
  Member.create(username: "권정안", email: '32@huhs.net',senior_number:32, password: 'kk1111',tel:'01000000000', admin: false, role:3);
  Member.create(username: "이태용", email: '31@huhs.net',senior_number:31, password: 'kk1111',tel:'01000000000', admin: false, role:3);
  Member.create(username: "이승훈", email: '30@huhs.net',senior_number:30, password: 'kk1111',tel:'01000000000', admin: false, role:3);
  Member.create(username: "용주성", email: '29@huhs.net',senior_number:29, password: 'kk1111',tel:'01000000000', admin: false, role:3);
  Member.create(username: "신태호", email: '28@huhs.net',senior_number:33, password: 'kk1111',tel:'01000000000', admin: false, role:1);
  Member.create(username: "성고인", email: '27@huhs.net',senior_number:32, password: 'kk1111',tel:'01000000000', admin: false, role:3);
  Member.create(username: "장용석", email: '26@huhs.net',senior_number:31, password: 'kk1111',tel:'01000000000', admin: false, role:3);
  Member.create(username: "유상오", email: '25@huhs.net',senior_number:30, password: 'kk1111',tel:'01000000000', admin: false, role:3);
  Member.create(username: "신성호", email: '24@huhs.net',senior_number:29, password: 'kk1111',tel:'01000000000', admin: false, role:3);
=end
#Category
Category.create(route: 'introduce', name: '동아리 소개')
Category.create(route: 'board', name: '게시판')
Category.create(route: 'addon', name: '편의기능',read_level:1)
Category.create(route: 'photo', name: '사진첩', default: "/board/photo/gallery")
Category.create(route: 'admin', name: '관리자 페이지',read_level:100 , default: "/admin")
#Board
Category.where(route: 'introduce').take.boards.create(route: 'history', name: '연혁', template: "home/history", show_last: true,show_comment:false, read_level:0)
Category.where(route: 'introduce').take.boards.create(route: 'staff', name: '운영진 소개', show_last: true,show_comment:false, read_level:0)
Category.where(route: 'introduce').take.boards.create(route: 'apply', name: '지원/신청', show_last: true,show_comment:false, read_level:0)
Category.where(route: 'board').take.boards.create(route: 'notice', name: '공지사항', show_last: false, read_level:1)
Category.where(route: 'board').take.boards.create(route: 'free', name: '자유 게시판', show_last: false, read_level:1, write_level:1)
Category.where(route: 'board').take.boards.create(route: 'homework', name: '과제 게시판', show_last: false, read_level:1, write_level:1)
Category.where(route: 'board').take.boards.create(route: 'ask', name: '질문 게시판', show_last: false, read_level:1, write_level:1)
Category.where(route: 'board').take.boards.create(route: 'idea', name: '아이디어 게시판', show_last: false, read_level:1, write_level:1)
Category.where(route: 'photo').take.boards.create(route: 'gallery', name: '사진첩', show_last: false, read_level:1, write_level:2)
Category.where(route: 'addon').take.boards.create(route: 'rsp', name: '가위바위보', show_last: true, template: "/game/rsp", read_level:1, write_level:100)
#Article
Board.where(route: 'staff').take.articles.create(content: "",title: "5기 운영진",member_id: 1, member_name:"임원")
Board.where(route: 'apply').take.articles.create(content: "",title: "songs", member_id: 1, member_name:"임원")
