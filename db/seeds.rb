# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'nokogiri'
require 'open-uri'
require 'byebug'
require 'pry-byebug'

puts "destroying all users"
puts "destoying all goals"
puts "destoying all foods"
puts "destoying all recipes"

ShoppingList.destroy_all
FavoriteRecipe.destroy_all
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

# goals_titles.each do |goal_title|
#   goal1 = Goal.create!(title: goal_title)
#   10.times do
#     food1 = Food.create!(name: Faker::Food.vegetables, description: Faker::Food.description)
#     GoalFood.create!(goal: goal1, food: food1)
#     3.times do
#       recipe1 = Recipe.create!(title: Faker::Food.dish, description: Faker::Food.description, cooking_time: 20, rating: 5)
#       RecipeFood.create!(food: food1, recipe: recipe1)
#     end
#   end
# end
goals_titles = ["Anti-Inflammatory", "Sleep Better", "Anxiety", "Boost Metabolism", "Weightloss", "Digestion", "Memory Boost", "Hair", "Skin", "Weightgain", "Heart", "Bones"]
goals_titles.each do |goal_title|
 Goal.create(title: goal_title)
end


weightloss = 'https://www.healthline.com/nutrition/20-most-weight-loss-friendly-foods'
doc = Nokogiri::HTML(open(weightloss), nil, 'utf-8')
weightloss_foods = []
doc.search(".css-0").each do |food|
  name = food.search("h2").text.strip.sub(/\d+.\s/, '')
  description = food.search(".css-pc7ote").text.strip.sub(/(Summary )/, '')
  if name != "" && description != ""
    food1 = Food.new(name: name, description: description)
    if food1.save
      weightloss_foods << food1
    end
  end
end

weightloss_foods.each do |food|
  GoalFood.create(goal: Goal.where(title: "Weightloss").first, food: food)
end

weightgain = 'https://www.healthline.com/nutrition/18-foods-to-gain-weight'
doc = Nokogiri::HTML(open(weightgain), nil, 'utf-8')
weightgain_foods = []
doc.search(".css-0").each do |food|
  name = food.search("h2").text.strip.sub(/\d+.\s/, '')
  description = food.search(".css-pc7ote").text.strip.sub(/(Summary)/, '')
  if name != "" && description != ""
    food1 = Food.new(name: name, description: description)
    if food1.save
      weightgain_foods << food1
    end
  end
end

weightgain_foods.each do |food|
  GoalFood.create(goal: Goal.where(title: "Weightgain").first, food: food)
end

anti_inflammatory = 'https://www.healthline.com/nutrition/13-anti-inflammatory-foods'
doc = Nokogiri::HTML(open(anti_inflammatory), nil, 'utf-8')
anti_inflammatory_foods = []
doc.search(".css-0").each do |food|
  name = food.search("h2").text.strip.sub(/\d+.\s/, '')
  description = food.search(".css-pc7ote").text.strip.sub(/(Summary )/, '')
  if name != "" && description != ""
    food1 = Food.new(name: name, description: description)
    if food1.save
      anti_inflammatory_foods << food1
    end
  end
end

anti_inflammatory_foods.each do |food|
  GoalFood.create(goal: Goal.where(title: "Anti-Inflammatory").first, food: food)
end

sleep_better = 'https://www.healthline.com/nutrition/9-foods-to-help-you-sleep'
doc = Nokogiri::HTML(open(sleep_better), nil, 'utf-8')
sleep_better_foods = []
doc.search(".css-0").each do |food|
  name = food.search("h2").text.strip.sub(/\d+.\s/, '')
  description = food.search(".css-pc7ote").text.strip.sub(/(Summary)/, '')
  if name != "" && description != ""
    food1 = Food.new(name: name, description: description)
    if food1.save
      sleep_better_foods << food1
    end
  end
end

sleep_better_foods.each do |food|
  GoalFood.create(goal: Goal.where(title: "Sleep Better").first, food: food)
end

boost_metabolism = 'https://www.healthline.com/nutrition/metabolism-boosting-foods'
doc = Nokogiri::HTML(open(boost_metabolism), nil, 'utf-8')
boost_metabolism_foods = []
doc.search(".css-0").each do |food|
  name = food.search("h2").text.strip.sub(/\d+.\s/, '')
  description = food.search(".css-pc7ote").text.strip.sub(/(Bottom Line: )/, '')
  if name != "" && description != ""
    food1 = Food.new(name: name, description: description)
    if food1.save
      boost_metabolism_foods << food1
    end
  end
end

boost_metabolism_foods.each do |food|
  GoalFood.create(goal: Goal.where(title: "Boost Metabolism").first, food: food)
end

memory_boost = 'https://www.healthline.com/nutrition/11-brain-foods'
doc = Nokogiri::HTML(open(memory_boost), nil, 'utf-8')
memory_boost_foods = []
doc.search(".css-0").each do |food|
  name = food.search("h2").text.strip.sub(/\d+.\s/, '')
  description = food.search(".css-pc7ote").text.strip.sub(/(Summary: )/, '')
  if name != "" && description != ""
    food1 = Food.new(name: name, description: description)
    if food1.save
      memory_boost_foods << food1
    end
  end
end

memory_boost_foods.each do |food|
  GoalFood.create(goal: Goal.where(title: "Memory Boost").first, food: food)
end

anxiety = 'https://www.healthline.com/nutrition/6-foods-that-reduce-anxiety'
doc = Nokogiri::HTML(open(anxiety), nil, 'utf-8')
anxiety_foods = []
doc.search(".css-0").each do |food|
  name = food.search("h2").text.strip.sub(/\d+.\s/, '')
  description = food.search(".css-pc7ote").text.strip.sub(/(Summary: )/, '')
  if name != "" && description != ""
    food1 = Food.new(name: name, description: description)
    if food1.save
      anxiety_foods << food1
    end
  end
end

anxiety_foods.each do |food|
  GoalFood.create(goal: Goal.where(title: "Anxiety").first, food: food)
end

heart = 'https://www.healthline.com/nutrition/heart-healthy-foods'
doc = Nokogiri::HTML(open(heart), nil, 'utf-8')
heart_foods = []
doc.search(".css-0").each do |food|
  name = food.search("h2").text.strip.sub(/\d+.\s/, '')
  description = food.search(".css-pc7ote").text.strip.sub(/(Summary )/, '')
  if name != "" && description != ""
    food1 = Food.new(name: name, description: description)
    if food1.save
      heart_foods << food1
    end
  end
end

heart_foods.each do |food|
  GoalFood.create(goal: Goal.where(title: "Heart").first, food: food)
end

digestion = 'https://www.healthline.com/nutrition/best-foods-for-digestion'
doc = Nokogiri::HTML(open(digestion), nil, 'utf-8')
digestion_foods = []
doc.search(".css-0").each do |food|
  name = food.search("h2").text.strip.sub(/\d+.\s/, '')
  description = food.search(".css-pc7ote").text.strip.sub(/(Summary )/, '')
  if name != "" && description != ""
    food1 = Food.new(name: name, description: description)
    if food1.save
      digestion_foods << food1
    end
  end
end

digestion_foods.each do |food|
  GoalFood.create(goal: Goal.where(title: "Digestion").first, food: food)
end

skin = 'https://www.healthline.com/nutrition/12-foods-for-healthy-skin'
doc = Nokogiri::HTML(open(skin), nil, 'utf-8')
skin_foods = []
doc.search(".css-0").each do |food|
  name = food.search("h2").text.strip.sub(/\d+.\s/, '')
  description = food.search(".css-pc7ote").text.strip.sub(/(SUMMARY)/, '')
  if name != "" && description != ""
    food1 = Food.new(name: name, description: description)
    if food1.save
      skin_foods << food1
    end
  end
end

skin_foods.each do |food|
  GoalFood.create(goal: Goal.where(title: "Skin").first, food: food)
end

hair = 'https://www.healthline.com/nutrition/foods-for-hair-growth'
doc = Nokogiri::HTML(open(hair), nil, 'utf-8')
hair_foods = []
doc.search(".css-0").each do |food|
  name = food.search("h2").text.strip.sub(/\d+.\s/, '')
  description = food.search(".css-pc7ote").text.strip.sub(/(Summary )/, '')
  if name != "" && description != ""
    food1 = Food.new(name: name, description: description)
    if food1.save
      hair_foods << food1
    end
  end
end

hair_foods.each do |food|
  GoalFood.create(goal: Goal.where(title: "Hair").first, food: food)
end

bone = 'https://www.healthline.com/nutrition/15-calcium-rich-foods'
doc = Nokogiri::HTML(open(bone), nil, 'utf-8')
bone_foods = []
doc.search(".css-0").each do |food|
  name = food.search("h2").text.strip.sub(/\d+.\s/, '')
  description = food.search(".css-pc7ote").text.strip.sub(/(Summary )/, '')
  if name != "" && description != ""
    food1 = Food.new(name: name, description: description)
    if food1.save
      bone_foods << food1
    end
  end
end

bone_foods.each do |food|
  GoalFood.create(goal: Goal.where(title: "Bones").first, food: food)
end

UserGoal.create!(user: user1, goal: Goal.first)
UserGoal.create!(user: user1, goal: Goal.last)

Food.first(5).each do |food|

  food = food.name.split(" ").join("%20")
  #food = "pumpkin"
  html = open("https://www.bonappetit.com/search/#{food}?content=recipe&sort=relevance").read

  doc = Nokogiri::HTML(html, nil, "utf-8")

  doc.search(".photo-link").each do |element|
    #binding.pry
    href = element.attributes["href"].value
    recipe_url = "https://www.bonappetit.com#{href}"
    doc2 = Nokogiri::HTML(open(recipe_url).read, nil, "utf-8")
    doc2.search(".split-screen-content-header__hed")
    title = doc2.search(".split-screen-content-header__hed").text
    description = doc2.search(".container--body-inner").text
    rating = doc2.search(".gRFxwe").text.to_i
    #binding.pry
    recipe1 = Recipe.create(title: title, description: description, rating: rating)
    RecipeFood.create(food: food, recipe: recipe1)
  end

end
