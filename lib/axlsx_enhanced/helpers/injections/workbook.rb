module AxlsxEnhanced
  module Helpers
    module Injections
      module Workbook
        def smart_add_worksheet(options)
          # Create the worksheet
          worksheet = self.add_worksheet(options)
          
          # Assign smart styles if any is given, and clean options hash
          worksheet.smart_styles = options[:smart_styles] || AxlsxEnhanced::Helpers::Styles.defaults
          options.delete(:smart_styles)
      
          # Perform a block yield if necessary
          yield worksheet if block_given?
          worksheet
        end
      end
    end
  end
end