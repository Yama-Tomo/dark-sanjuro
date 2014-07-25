module NonActiveRecord
  class Base
    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend  ActiveModel::Naming
    
    def initialize(attributes = {})
      return if attributes.nil?
      
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end
    
    def persisted?
      false
    end
    
    def read_attribute(key)
      send(key)
    end
  end
end
