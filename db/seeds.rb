# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Campaign.destroy_all

User.create!([{
    username: "stu",
    password: "pickles"
}])


Campaign.create!([
    {
        title: "Nothing Ado About Much",
        party: "Three rusty spoons",
        level: "5",
        c_notes: "We're going on a trip in our favorite rocket ship",
        dm_notes: "What assholes.",
        user_id: 1
    },
    {
        title: "The Party that Never Found The Plot Hook",
        party: "Your Mom",
        level: "5",
        c_notes: "We're tramping throuuuuuugh the bush",
        dm_notes: "On and on we push OH",
        user_id: 1
    }
])
