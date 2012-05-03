module FieldAvgs

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def define_field_avgs
      ReviewMetadata.all_fields.each do |field|
        define_method("#{field}_avg".to_sym) {return (self.reviews.average(field)*20)}
      end
    end
  end
end

