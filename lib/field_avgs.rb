  module FieldAvgs

    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def define_field_avgs
        FIELDS.each do |field|
          define_method("#{field}_avg".to_sym) {return (self.reviews.average(field)*20)}
        end
      end
    end
  end

