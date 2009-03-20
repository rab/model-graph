class Advertisement < ActiveRecord::Base  # :nodoc:
  belongs_to :issue
  belongs_to :vendor
end
class Article  < ActiveRecord::Base  # :nodoc:
  has_one :author
  belongs_to :issue
end
class Author  < ActiveRecord::Base  # :nodoc:
  has_many :articles
end
class Issue < ActiveRecord::Base # :nodoc:
  has_one :theme
  has_many :articles
  has_many :advertisements
end
class Magazine < ActiveRecord::Base  # :nodoc:
  has_many :issues
  has_many :articles, :through => :issues
  has_many :subscriptions
  has_many :subscribers, :through => :subscriptions
end
class Theme < ActiveRecord::Base # :nodoc:
  belongs_to :issue
end
class Subscriber < ActiveRecord::Base  # :nodoc:
  has_many :subscriptions
  has_many :magazines, :through => :subscriptions
end
class Subscription < ActiveRecord::Base  # :nodoc:
  belongs_to :subscriber
  belongs_to :magazine
end
class Vendor < ActiveRecord::Base  # :nodoc:
  has_many :advertisements
end
