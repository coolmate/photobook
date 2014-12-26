# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

album = Album.create

page = Page.create(layout: 1, album: album)
page2 = Page.create(layout: 1, album: album)
page3 = Page.create(layout: 2, album: album)

Photo.create(url: 'http://i.imgur.com/2nCt3Sb.jpg', page: page)
Photo.create(url: 'http://i.imgur.com/VIevFSY.jpg', page: page)
Photo.create(url: 'http://i.imgur.com/v4Alr9l.jpg', page: page2)
Photo.create(url: 'http://i.imgur.com/uHdvuwH.jpg', page: page2)
Photo.create(url: 'http://i.imgur.com/F7rBHZa.jpg', page: page3)

Quote.create(content: 'Lorem ipsum dolor sit amet, consectetur
    adipiscing elit. Integer risus ante, consequat euismod tellus vel,
    interdum tristique diam.',
    page: page)
