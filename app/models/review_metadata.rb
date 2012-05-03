class ReviewMetadata < ActiveRecord::Base
  def self.all_fields
    ReviewMetadata.all.map(&:field_name)
  end
end
