# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


News = News.create(


  )

News.create!(
  [
    {
      year: 2020,
      month: 5,
      date: 17,
      title: '○○のお知らせ1'
      published: true
      # image: File.open('./app/assets/images/test.jpg')
    },
    {
      year: 2020,
      month: 5,
      date: 31,
      title: '○○のお知らせ2'
      published: true
      # image: File.open('./app/assets/images/test.jpg')
    },
    {
      year: 2020,
      month: 6,
      date: 5,
      title: '○○のお知らせ3'
      published: true
      # image: File.open('./app/assets/images/test.jpg')
    },
  ]
)