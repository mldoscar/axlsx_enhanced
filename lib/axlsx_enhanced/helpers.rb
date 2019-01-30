module AxlsxEnhanced
  module Helpers
    # Requirements
    require File.expand_path(File.dirname(__FILE__)) + '/helpers/styles/defaults'
    require File.expand_path(File.dirname(__FILE__)) + '/helpers/styles/style'
    require File.expand_path(File.dirname(__FILE__)) + '/helpers/styles/style_collection'
    
    require File.expand_path(File.dirname(__FILE__)) + '/helpers/injections/worksheet'
    require File.expand_path(File.dirname(__FILE__)) + '/helpers/injections/workbook'
    require File.expand_path(File.dirname(__FILE__)) + '/helpers/injections/cell'
  end
end