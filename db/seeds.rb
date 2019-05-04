# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Create admin user
User.create(email:'admin@admin.com',password:"1111111111",password_confirmation:"1111111111",
role:1)


#Creating Publishers
marvel = Publisher.create(name:'Miracles');
dc = Publisher.create(name:'DOUG Comics');
tommorow = Publisher.create(name:'Tommorow Comics');

#Creating Comics
xmenComic = Comic.create(title:'Less-Men #1',description:'A',release_date:'15-08-2018',publisher: marvel,price:15.0,pages:20,rating:7);
batmanComic = Comic.create(title:'Beatman #1',description:'B',release_date:'09-12-2018',publisher: dc,price:20.0,pages:25,rating:6);
supermanComic = Comic.create(title:'Silent Man #1',description:'C',release_date:'06-08-2018',publisher: dc,price:15.0,pages:20,rating:5);
ghostStories = Comic.create(title:'Ghost Stories #3',description:'D',release_date:'15-05-2018',publisher: tommorow,price:15.0,pages:30,rating:8);
xmen2Comic = Comic.create(title:'Less-Men #2',description:'E',release_date:'15-09-2018',publisher: marvel,price:15.0,pages:20,rating:8);
ghostStories2 = Comic.create(title:'Ghost Stories #4',description:'F',release_date:'15-10-2018',publisher: tommorow,price:15.0,pages:25,rating:4);
spidermanComic = Comic.create(title:'Bananaman #3',description:'G',release_date:'10-08-2018',publisher: marvel,price:15.0,pages:20,rating:2);
wonderWomanComic = Comic.create(title:'Giant Woman #1',description:'H',release_date:'10-05-2018',publisher: dc,price:20.0,pages:30,rating:10);

#Creating Characters
jinkser = Character.create(name:'Jinkser',bio:'Very sinister.',publisher:dc)
beatman = Character.create(name:'Beatman',bio:'Very dark.',publisher:dc)
silentman = Character.create(name:'Silentman',bio:'Report to silent',publisher:dc)
lessman = Character.create(name:'Lessman',bio:'Peter',publisher:marvel)
talia = Character.create(name:'Talia',bio:'Warior',publisher:tommorow)
blueBird = Character.create(name:'Blue Bird',bio:'Bad guy',publisher:tommorow)
ironMan = Character.create(name:'Ilon Man',bio:'Rich',publisher:marvel)
greyWorm = Character.create(name:'Grey Worm',bio:'Special',publisher:tommorow)

#Adding characters to comics
batmanComic.characters << jinkser
batmanComic.characters << beatman

talia.comics << [ghostStories, ghostStories2]

supermanComic.characters << silentman

lessman.comics << spidermanComic


#Type of Artist
writer = Type.create(name:'Writer')
colorist = Type.create(name:'Colorist')
coverArtist = Type.create(name:'Cover Artist')
letterer = Type.create(name:'Letterer')
editor = Type.create(name:'Editor')
assistantEditor = Type.create(name:'Assistant Editor')

#Artists
john = Artist.create(name:'John',surname:'Snow',biography:'Green',type:colorist)
dale = Artist.create(name:'Dale',surname:'Sure',biography:'Fun',type:coverArtist)
lucy = Artist.create(name:'Lucy',surname:'Lu',biography:'Fun',type:letterer)
frank = Artist.create(name:'Frank',surname:'Lith',biography:'Fun',type:writer)
lit = Artist.create(name:'Lit',surname:'Hawk',biography:'Fun',type:editor)
joe = Artist.create(name:'Joe',surname:'Frjk',biography:'Fun',type:assistantEditor)
