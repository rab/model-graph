class Post < ActiveRecord::Base
  has_many :comments
  has_one :author
  has_and_belongs_to_many :categories
end

class Author < ActiveRecord::Base
#  has_many :posts
end

class Comment < ActiveRecord::Base
  belongs_to :post
end

class Category < ActiveRecord::Base
  has_and_belongs_to_many :posts
end
