module AxlsxEnhanced
  module Helpers
    module Injections
      module Worksheet
        def smart_styles=(value)
          @smart_styles = AxlsxEnhanced::Helpers::Styles::StyleCollection.new(self, value || [])
        end
      
        def smart_styles
          return @smart_styles
        end
      
        def smart_add_separator
          return self.add_row [nil]
        end
      
        def smart_add_row(array, args = {})
          unless args[:style].blank?
            if args[:style].is_a?(Array)
              # Look for all smart styles and parse them into base styles
              base_styles = []
      
              args[:style].each do |item|
                style_hash = {}
      
                # Parse the item into an array
                item_array = item.is_a?(Array) ? item : [item]
      
                item_array.each do |style|
                  next if style.nil?
                  
                  # Get smart style object
                  smart_style = self.smart_styles.find(style)
      
                  # Merge the smart style properties into the style hash
                  style_hash.deep_merge!(smart_style.properties)
                end
      
                # Extract heigh property if any
                args[:height] ||= style_hash[:height] if style_hash[:height].present?
      
                # Push a parsed base style into the array
                base_styles.push self.styles.add_style(style_hash)
              end
            else
              style_hash = {}
      
              # Get smart style object
              smart_style = self.smart_styles.find args[:style]
      
              # Merge the smart style properties into the style hash
              style_hash.deep_merge!(smart_style.properties)
      
              # Extract heigh property if any
              args[:height] ||= style_hash[:height] if style_hash[:height].present?
      
              # Set a base style as a single Integer number
              base_styles = self.styles.add_style(smart_style.properties)
            end
      
            # Re-write style args setting the base styles
            args[:style] = base_styles
          end
      
          # Call original row creation method
          return self.add_row(array, args)
        end
      end
    end
  end
end