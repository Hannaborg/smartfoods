# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "destroying all users"
puts "destoying all goals"
puts "destoying all foods"
puts "destoying all recipes"

UserGoal.destroy_all
GoalFood.destroy_all
RecipeFood.destroy_all
User.destroy_all
Goal.destroy_all
Food.destroy_all
Recipe.destroy_all

puts "creating user..."
puts "creating goals..."
puts "creating foods..."
puts "creating recipes..."

user1 = User.create!(email: "hanna@gmail.com", password: "123456")
user2 = User.create!(email: "queen@gmail.com", password: "123456")

goals_titles = ["Improved Sleep", "More Energy", "Better Skin", "Better Mood", "Sharper Focus", "Weightloss"]

goals_titles.each do |goal_title|
  goal1 = Goal.create!(title: goal_title)
  10.times do
    food1 = Food.create!(name: Faker::Food.vegetables, description: Faker::Food.description)
    GoalFood.create!(goal: goal1, food: food1)
    3.times do
      recipe1 = Recipe.create!(title: Faker::Food.dish, description: Faker::Food.description, cooking_time: 20, rating: 5)
      RecipeFood.create!(food: food1, recipe: recipe1)
    end
  end
end

UserGoal.create!(user: user1, goal: Goal.first)
UserGoal.create!(user: user1, goal: Goal.last)
