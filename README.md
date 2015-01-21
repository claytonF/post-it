Creating a rails app

#post-it

This app will list blog posts which we can create read update and destroy (CRUD)

#steps for creating a resource

1. Define Routes
	- in config/routes make routes available
	- run rake routes in terminal to confirm

2. Generate a controller
	- 'rails generate controller posts' - posts is whatever your app is about -this will create a folder with the same name under /views, and a [posts].controller.rb file with the same name under /controllers
	( can destroy the controller by typing rails destroy controller posts  -but this wont destroy any routes you have created)

3. Define an 'action'
	- this happens by default if pass an action name as a final argument to the generator
	- this action renders a view of the same name by default (in views/posts) 

4. Create view code

## Flash - used in controller

Convenient way to notify users about requests through the "flash" hash.

It is just a hash available to the views and controllers:

```ruby

flash = {}

```

that is all you need - use it like any other hash with a key value pair

```ruby

flash[:success] = "Whoop"
flash[:error] = "damn"
flash[:sausage] = "sausage"

=>  {
		:success => "whoop"
		:error => "damn"
		:sausage => "sausage"
	}

#can loop over all the flashes
flash.each do |key, value|
	key		#=> :success
	value	#=> "whoop"
end	
   
```

