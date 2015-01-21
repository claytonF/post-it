class Post < ActiveRecord::Base #this ActiveRecord code lets us interface with DB
# this Post model is a class
# a Post instance is an object representing the db table > posts
# it has attributes called 'title', 'body' etc which correspond to the columns in the table

validates :title, presence: true, uniqueness: true
validates :body, length: {minimum:50}

end
