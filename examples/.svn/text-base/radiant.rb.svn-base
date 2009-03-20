class  < ActiveRecord::Base
  has_many 
  has_one 
  has_and_belongs_to_many 
  belongs_to 
end

class Page < ActiveRecord::Base
  has_many :content_parts
  belongs_to :behavior
  belongs_to :layout
end

class Behavior < ActiveRecord::Base
  has_many :pages
  has_one 
  has_and_belongs_to_many 
  belongs_to 
end

class Layout  < ActiveRecord::Base
  has_many 
  has_one 
  has_and_belongs_to_many 
  belongs_to 
end

class ContentPart  < ActiveRecord::Base
  has_many 
  has_one :filter
  has_and_belongs_to_many 
  belongs_to :page
end

class Filter < ActiveRecord::Base
  has_many 
  has_one 
  has_and_belongs_to_many 
  belongs_to :content_parts
end

