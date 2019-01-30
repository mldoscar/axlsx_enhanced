module AxlsxEnhanced
  module Helpers
    module Injections
      module Cell
        def smart_style=(value)
          return if value.nil?
      
          # Get sheet and workbook
          sheet = self.row.worksheet
          book  = sheet.workbook
      
          if value.is_a? Array
            # Iterate style if value is an Array
            new_style = {}
      
            value.each do |v|
              # Find the specified style and merge it into the new style
              s = sheet.smart_styles.find(v.to_sym)
              new_style.deep_merge! s.properties
            end
          else
            # Find the specified style
            new_style = sheet.smart_styles.find(value).properties
          end
      
          # Add the style to the workbook
          style_id = book.styles.add_style new_style
      
          # Assign the style into the cell
          self.style = style_id
      
          # Return the style id
          return style_id
        end
      end
    end
  end
end