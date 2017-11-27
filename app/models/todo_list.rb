class TodoList < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  belongs_to :user
  has_many :items

  validates :title, :presence => true, :uniqueness => true

end
