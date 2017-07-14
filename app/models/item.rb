class Item < ActiveRecord::Base
  belongs_to :todo_list
  belongs_to :user

  validates :name, :presence => true, :uniqueness => true

  def completed?
    !completed_at.blank?
  end

end
