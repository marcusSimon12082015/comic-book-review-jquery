# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
		User has_many comics 
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User) 
	Comic belongs_to Publisher, Review belongs_to User and belongs_to Comic
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
		Comic has many Users through UserComics, Comic has many Characters through ComicCharacters, Comic has many Artists through ComicArtists	
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
		Comic has_many Users through Reviews, Users has_many Comics through Reviews 
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
		Review has title and content as user submittable attribute
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
		Comic -> presence:title,description,price,pages; (price,pages) numericality -> greater_than > 0; validates associated --> artists
		Review -> presence: title, content 
		Artist -> presence: name, surname; format: name, surname 
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
		Comic -> best_sellers -> comics/best_sellers
- [x] Include signup (how e.g. Devise)
	Devise
- [x] Include login (how e.g. Devise)
	Devise
- [x] Include logout (how e.g. Devise)
	Devise
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
	Devise/OmniAuth (Github)
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
	comics/2/reviews
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
	comics/2/reviews/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate