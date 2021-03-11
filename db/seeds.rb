require 'json'
require 'rest_client'
require 'faker'
require 'nokogiri'
require 'open-uri'

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

goals_titles = ["Reduced Inflammation", "Better Sleep", "Anxiety Relief", "Metabolism Boost", "Healthy Weightloss", "Gut Health", "Memory Boost", "Strong Hair", "Glowing Skin", "Healthy Weightgain", "Good Heart", "Strong Bones"]
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
  GoalFood.create(goal: Goal.where(title: "Healthy Weightloss").first, food: food)
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
  GoalFood.create(goal: Goal.where(title: "Healthy Weightgain").first, food: food)
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
  GoalFood.create(goal: Goal.where(title: "Reduced Inflammation").first, food: food)
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
  GoalFood.create(goal: Goal.where(title: "Better Sleep").first, food: food)
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
  GoalFood.create(goal: Goal.where(title: "Metabolism Boost").first, food: food)
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
  GoalFood.create(goal: Goal.where(title: "Anxiety Relief").first, food: food)
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
  GoalFood.create(goal: Goal.where(title: "Good Heart").first, food: food)
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
  GoalFood.create(goal: Goal.where(title: "Gut Health").first, food: food)
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
  GoalFood.create(goal: Goal.where(title: "Glowing Skin").first, food: food)
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
  GoalFood.create(goal: Goal.where(title: "Strong Hair").first, food: food)
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
  GoalFood.create(goal: Goal.where(title: "Strong Bones").first, food: food)
end

UserGoal.create!(user: user1, goal: Goal.first)
UserGoal.create!(user: user1, goal: Goal.last)

Food.all.each do |food|
  food1 = food.name.split(" ").join("%20")

  html = open("https://www.bonappetit.com/search/#{food1}?content=recipe&sort=relevance").read

  doc = Nokogiri::HTML(html, nil, "utf-8")

  counter = 0
  doc.search(".photo-link").each do |element|
    break if counter > 5
    href = element.attributes["href"].value
    recipe_url = "https://www.bonappetit.com#{href}"

    ingredients = []
    steps = []
    doc2 = Nokogiri::HTML(open(recipe_url).read, nil, "utf-8")
    doc2.search(".split-screen-content-header__hed")
    title = doc2.search(".split-screen-content-header__hed").text
    description = doc2.search(".container--body-inner").text
    rating = doc2.search(".gRFxwe").text.to_i
    ingredients_number = doc2.search(".jqizJz.nEToO").text.split("")
    doc2.search(".jqizJz.beTuLZ").each do |element|
      ingredients << element.text
    end
    steps_numbers = []
    steps_descriptions = []
    doc2.search('.sc-iBPRYJ.sc-fUSoCb.cvwWNz').each do |div|
      div.search('.bqTNGJ').each do |elem|
        # p elem.text.strip
        step_number = elem.search('.sc-ieSyQn.sc-gWnQNU.efdRpC.eilsXT')
        # p step_number.text.strip
        step_description = elem.search('.sc-fgOGuH.eLRJRO.cgiMXa.fPrMvi')
        # p step_description.text.strip
        steps_numbers << step_number.text.strip
        steps_descriptions << step_description.text.strip
      end
    end
    p steps_numbers
    p steps_descriptions


    recipe1 = Recipe.new(title: title, description: description, rating: rating, cooking_time: 20,)
    puts recipe1.title
    counter += 1
    if recipe1.save
      RecipeFood.create(food: food, recipe: recipe1)
      ingredients.each_with_index do |element, index|
        Ingredient.create(quantity: ingredients_number[index], description: element, recipe: recipe1)
      end
      steps_numbers.each do |element|
        step = Step.create(number: element, recipe: recipe1)
        steps_descriptions.each do |description|
          step.description = description
          step.save!
        end
      end
    end
  end
end

#Icon fetch API
Food.all.each do |food|
  endpoint = "https://api.iconfinder.com/v4/icons/search?query=#{food.name}&count=1&license=commercial-nonattribution"
  headers = { 'Authorization' => 'Bearer Zb7Uz483KKmIa6aUfDl7OpqfMcbbLr1wim64yB7wAAQRaBNpFBmTLKwzpm1xHdG3'}
  response = RestClient.get(endpoint, headers)
  icon_info = JSON.parse(response.body)
  if icon_info["total_count"] == 0
    food.url = "https://cdn3.iconfinder.com/data/icons/streamline-icon-set-free-pack/48/Streamline-94-512.png"
    food.save
  else
    icon_url = icon_info["icons"].first["raster_sizes"].last["formats"].last["preview_url"]
    food.url = icon_url
    food.save
  end
end
