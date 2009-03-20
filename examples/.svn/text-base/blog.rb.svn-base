class Author < ActiveRecord::Base
  has_many :posts
#   has_many :favorite_authors
#   has_many :users, :through => :favorite_authors, :class_name => 'User'
end

class Category < ActiveRecord::Base
  has_and_belongs_to_many :posts
end

class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
end

class FavoriteAuthor < ActiveRecord::Base
  belongs_to :user
  belongs_to :author
end

class Post < ActiveRecord::Base
  has_many :comments
  has_one :author
  has_and_belongs_to_many :categories
end

class Theme < ActiveRecord::Base
  belongs_to :user
end

class User < ActiveRecord::Base
  has_many :comments
  has_one :theme
  has_many :favorite_authors
end
