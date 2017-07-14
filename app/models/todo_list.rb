class TodoList < ActiveRecord::Base
  belongs_to :user
  has_many :items

  validates :title, :presence => true, :uniqueness => true

end
