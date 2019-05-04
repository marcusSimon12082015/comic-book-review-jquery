module Order
  def self.included(klass)
    klass.extend(ClassMethods)
  end

  module ClassMethods
    def customOrder(attribute,options={})
      sortingOrder = options[:sort] ||= 'DESC'
      limitNumber = options[:limit] ||= 0

      if has_attribute? attribute
        limitNumber > 0 ? order(attribute + " " + sortingOrder).limit(limitNumber)
                        : order(attribute + " " + sortingOrder)
      else
        all
      end 
    end
  end
end
