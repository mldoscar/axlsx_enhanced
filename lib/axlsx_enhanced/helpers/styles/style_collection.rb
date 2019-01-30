module AxlsxEnhanced
  module Helpers
    module Styles
      class StyleCollection
        def initialize(worksheet, items = [])
          @worksheet = worksheet
          @collection = []
      
          self.add(items)
        end
      
        def worksheet
          return @worksheet
        end
      
        def collection
          return @collection
        end
      
        def add(args)
          items = args.is_a?(Array) ? args : [args]
      
          items.each do |item|
            self.collection.push AxlsxEnhanced::Helpers::Styles::Style.new(item)
          end
        end
        
        def find(name)
          return @collection.find { |x| x.name == name.to_sym }
        end
      end
    end
  end
end