class Item < ActiveRecord::Base
  belongs_to :list

  def days_left
    7 - ((Time.now.to_i - self.created_at.to_i) / 86400)
  end
end
