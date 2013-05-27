class Tutorial < ActiveRecord::Base
  belongs_to :user
  has_many :conversations
  has_many :posts, :as => :postable, :dependent => :destroy

  attr_accessible :about, :title, :url, :tag_list, :paid, :hours
  validates_presence_of :title, :url
  acts_as_taggable_on :tags

  ActsAsTaggableOn.force_lowercase = true
  
end
