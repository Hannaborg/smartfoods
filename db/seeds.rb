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

puts "destroying all users"
puts "destroying all goals"
puts "destroying all foods"
puts "destroying all recipes"
puts "destroying all markets"

ShoppingList.destroy_all
FavoriteRecipe.destroy_all
UserGoal.destroy_all
GoalFood.destroy_all
RecipeFood.destroy_all
User.destroy_all
Goal.destroy_all
Food.destroy_all
Recipe.destroy_all
Market.destroy_all

puts "creating user..."
puts "creating goals..."
puts "creating foods..."
puts "creating recipes..."
puts "creating markets..."

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

Food.all.each do |food|
  food1 = food.name.split(" ").join("%20")
  #food = "pumpkin"
  puts food1
  puts food.name
  html = open("https://www.bonappetit.com/search/#{food1}?content=recipe&sort=relevance").read

  doc = Nokogiri::HTML(html, nil, "utf-8")

  counter = 0
  doc.search(".photo-link").each do |element|
    break if counter > 5
    href = element.attributes["href"].value
    recipe_url = "https://www.bonappetit.com#{href}"
    doc2 = Nokogiri::HTML(open(recipe_url).read, nil, "utf-8")
    doc2.search(".split-screen-content-header__hed")
    title = doc2.search(".split-screen-content-header__hed").text
    description = doc2.search(".container--body-inner").text
    rating = doc2.search(".gRFxwe").text.to_i
    ingredients_number = doc2.search(".jqizJz.nEToO").text.split("")
    ingredients = []
    doc2.search(".jqizJz.beTuLZ").each do |element|
      ingredients << element.text
    end


    steps = doc2.search(".cvwWNz").text
    recipe1 = Recipe.new(title: title, description: description, rating: rating, cooking_time: 20)
    puts recipe1.title
    counter += 1
    if recipe1.save
      RecipeFood.create(food: food, recipe: recipe1)
      ingredients.each_with_index do |element, index|
        Ingredient.create(quantity: ingredients_number[index], description: element, recipe: recipe1)
      end
    end

  end

end

# Lisbon
Market.create!(name: "Lidl", address: "Rua Maria da Fonte, Lisboa")
Market.create!(name: "Minipreço", address: "Rua Luciano Cordeiro 38, Lisboa")
Market.create!(name: "Minipreço", address: "Rua Barata Salgueiro 4, Lisboa")
Market.create!(name: "Minipreço", address: "Rua de São Bento 15, Lisboa")
Market.create!(name: "Continente", address: "Avenida Duque de Loulé 96, Lisboa")
Market.create!(name: "Continente", address: "Rua Almirante Barroso 9, Largo de São Sebastião da Pedreira 9B 9A, Lisboa")
Market.create!(name: "Continente", address: "Rua Carlos Mardel 4, Lisboa")
Market.create!(name: "Continente", address: "Travessa de Santa Quitéria 38, Lisboa")
Market.create!(name: "Sarkar", address: "Rua Luciano Cordeiro 56A, Lisboa")
Market.create!(name: "El Corte Inglés", address: "Avenida António Augusto de Aguiar 31, Lisboa")
Market.create!(name: "Mini Mercado Laranja", address: "Rua Silva Carvalho Nr 155-b, Lisboa")
Market.create!(name: "Pingo Doce", address: "Largo Chão do Loureiro, Lisboa")
Market.create!(name: "Pingo Doce", address: "Rua 1º de Dezembro 67 83, Lisboa")
Market.create!(name: "Amanhecer", address: "Rua da Palma 41 A, Lisboa")
Market.create!(name: "Meu Super", address: "Rua do Alecrim 54, Lisboa")

# Madrid
Market.create!(name: "El Corte Inglés", address: "Calle de Preciados, 3, 28013 Madrid, Spain")

# Oslo
Market.create!(name: "MENY Kringsjå", address: "Minister Ditleffs vei 21, 0862 Oslo, Norway")
Market.create!(name: "MENY Colosseum", address: "Sørkedalsveien 10B, 0369 Oslo, Norway")
Market.create!(name: "MENY Skøyen", address: "Karenslyst Allé 9, 0278 Oslo, Norway")
Market.create!(name: "MENY Bogstadveien", address: "Bogstadveien 36, 0366 Oslo, Norway")
Market.create!(name: "MENY Oslo City", address: "Stenersgata 1, 0050 Oslo, Norway")
Market.create!(name: "MENY Grønland Torg", address: "Smalgangen 49, 0188 Oslo, Norway")
Market.create!(name: "MENY Ringnes Park", address: "Sannergata 6C, 0555 Oslo, Norway")
Market.create!(name: "MENY Fornebu", address: "Snarøyveien 55-57, 1364 Fornebu, Norway")
Market.create!(name: "MENY Vøyenenga", address: "Vøyenengtunet 14, 1339 Vøyenenga, Norway")

# Paris
Market.create!(name: "Carrefour", address: "79 Rue de Seine, 75006 Paris, France")

# London
Market.create!(name: "Tesco", address: "17-25 Regent St, St. James's, London SW1Y 4LR, United Kingdom")
