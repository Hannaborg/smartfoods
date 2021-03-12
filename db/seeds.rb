require 'json'
require 'rest_client'
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
Ingredient.destroy_all
Step.destroy_all

puts "creating user..."
puts "creating goals..."
puts "creating foods..."
puts "creating recipes..."
puts "start creating foods according to each goal..."

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

Food.first(2).each do |food|
  
puts "finished creating foods according to each goal"
puts "start creating recipes for each food"

  food1 = food.name.split(" ").join("%20")

  html = open("https://www.bonappetit.com/search/#{food1}?content=recipe&sort=relevance").read

  doc = Nokogiri::HTML(html, nil, "utf-8")

  counter = 0
  doc.search(".photo-link").each do |element|
    break if counter > 6
    href = element.attributes["href"].value
    recipe_url = "https://www.bonappetit.com#{href}"


    ingredients = []
    steps = []
    doc2 = Nokogiri::HTML(open(recipe_url).read, nil, "utf-8")
    doc2.search(".split-screen-content-header__hed")
    title = doc2.search(".split-screen-content-header__hed").text
    description = doc2.search(".container--body-inner").text
    rating = doc2.search(".gRFxwe").text.to_i
    image = doc2.search(".grid-layout__span-6 .responsive-image__image")
    ingredients_number = doc2.search(".jqizJz.sc-jMScns").text.split("")
    doc2.search(".jqizJz.sc-cuaApf").each do |element|
      ingredients << element.text
    end

    steps_numbers = []
    steps_descriptions = []
    doc2.search('.sc-iBPRYJ.sc-dRKXJR.cvwWNz').each do |div|
      div.search('.jvTHbr').each do |elem|
        # p elem.text.strip
        step_number = elem.search('.sc-ddQoNp.sc-fgOGuH.efdRpC.eilsXT')
        # p step_number.text.strip
        step_description = elem.search('.sc-dTGQxN.eLRJRO.cgiMXa.gGmQNC')
        # p step_description.text.strip
        steps_numbers << step_number.text.strip
        steps_descriptions << step_description.text.strip
      end
    end
    p steps_numbers
    p steps_descriptions

    img_url = image.attribute("src").value
 
    img = URI.open(img_url)
    
  

    recipe1 = Recipe.new(title: title, description: description, rating: rating, cooking_time: 20)
    recipe1.photo.attach(io: img, filename: 'recipe.png', content_type: 'image/png') 
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

puts "finished creating recipes for each food"
puts "start fetching icons"

#Icon fetch API
Food.all.each do |food|
  endpoint = "https://api.iconfinder.com/v4/icons/search?query=#{food.name}&count=1&license=commercial-nonattribution"
  headers = { 'Authorization' => 'Bearer Zb7Uz483KKmIa6aUfDl7OpqfMcbbLr1wim64yB7wAAQRaBNpFBmTLKwzpm1xHdG3'}
  response = RestClient.get(endpoint, headers)
  icon_info = JSON.parse(response.body)
  if icon_info["total_count"] == 0
    food.url = "https://cdn3.iconfinder.com/data/icons/streamline-icon-set-free-pack/48/Streamline-94-512.png"
    food.save!
  else
    icon_url = icon_info["icons"].first["raster_sizes"].last["formats"].last["preview_url"]
    food.url = icon_url
    food.save!
  end
end

puts "finished fetching icons"
puts "start creating markets"

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
puts "finished creating market"
