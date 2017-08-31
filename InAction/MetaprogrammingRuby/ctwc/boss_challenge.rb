module CheckedAttributes

  def self.included(mod)
    mod.extend(ClassMethods)
  end

  module ClassMethods

    def attr_checked(attribute, &validator)
      define_method "#{attribute}=".to_sym do |value|
        raise 'Invalid attribute' unless validator.call(value)
        instance_variable_set("@#{attribute}", value)
      end

      define_method "#{attribute}".to_sym do
        instance_variable_get("@#{attribute}")
      end
    end

  end

end
