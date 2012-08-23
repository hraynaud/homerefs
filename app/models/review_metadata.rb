class ReviewMetadata < ActiveRecord::Base

  default_scope :order => "position ASC"

  def self.all_fields
    # NOTE do a check on existence of this table otherwise when rails loads the environment it triggers a race condiion while loading of  active admin gem which calls this method
    # and prevents even the migrations from running. -
    if table_exists?
      self.order("position asc").map(&:field_name) #TODO use pluck?
    else
      []
    end
  end
end
