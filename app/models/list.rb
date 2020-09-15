class List < ActiveRecord::Base
  belongs_to :user
  has_many :items

  before_save { self.permissions ||= :closed }

  enum permissions: [:closed, :open, :viewable]

end
