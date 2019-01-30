require "active_support/core_ext/object/blank"
require "active_support/core_ext/hash/deep_merge"
require "axlsx"

module AxlsxEnhanced
  require "axlsx_enhanced/version"
  require "axlsx_enhanced/helpers"
end

module Axlsx
  # Inclussions
  class Workbook
    include AxlsxEnhanced::Helpers::Injections::Workbook
  end
  class Worksheet
    include AxlsxEnhanced::Helpers::Injections::Worksheet
  end
  class Cell
    include AxlsxEnhanced::Helpers::Injections::Cell
  end
end