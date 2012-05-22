class ReviewMetadata < ActiveRecord::Base
  def self.all_fields
    ReviewMetadata.order("position asc").all.map(&:field_name)
  end
end
