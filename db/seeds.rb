# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
films = [
  { 
    title: "2001: A Space Odyssey", 
    rating: 9.5, 
    genre: "Science Fiction" 
  },
  {
    title: "The Last House on the Left",
    rating: 4.1,
    genre: "Horror"
  },
  {
    title: "Shrek",
    rating: 8.8,
    genre: "Family"
  },
  { 
    title: "2012",
    rating: 3.9,
    genre: "Drama"
  },
  {
    title: "Up",
    rating: 9.8,
    genre: "Family"
  },
  {
    title: "Interstellar",
    rating: 7.3,
    genre: "Science Fiction"
  },
  {
    title: "Shrek 2",
    rating: 8.8,
    genre: "Family"
  }
]

films.each {|film| Film.create(title: film[:title], rating: film[:rating], genre: film[:genre], available: true)}