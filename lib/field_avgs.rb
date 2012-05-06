module FieldAvgs

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def define_field_avgs
      ReviewMetadata.all_fields.each do |field|
        define_method("#{field}_avg".to_sym) {
          if(reviews != [])
           20 * Review.where(:building_id => self.id).average(field)
          else
            0
          end
        }
      end
    end
  end
end
