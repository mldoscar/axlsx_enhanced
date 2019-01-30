module AxlsxEnhanced
  module Helpers
    module Styles
      class Style
        attr_accessor :properties

        def initialize(args = {})
          self.name       = args[:name]
          self.properties = args[:properties]
        end
      
        def name=(value)
          @name = value.to_sym
        end
      
        def name
          return @name
        end
      
        def add_property(hash)
          self.properties.deep_merge! hash
        end
      end
    end
  end
end