module AxlsxEnhanced
  module Helpers
    module Styles
      def self.defaults
        return [
          # Text style
          { name: :bold,            properties: { b: true } },
          { name: :italic,          properties: { i: true } },
          { name: :underline,       properties: { u: true } },
          { name: :strike,          properties: { strike: true } },
  
          # Horizontal alignment
          { name: :halign_left,     properties: { alignment: { horizontal: :left   } } },
          { name: :halign_center,   properties: { alignment: { horizontal: :center } } },
          { name: :halign_right,    properties: { alignment: { horizontal: :right  } } },
  
          # Vertical alignment
          { name: :valign_top,      properties: { alignment: { vertial: :top    } } },
          { name: :valign_center,   properties: { alignment: { vertial: :center } } },
          { name: :valign_right,    properties: { alignment: { vertial: :bottom } } },
          { name: :wrap_text,       properties: { alignment: { wrap_text: true  } } },
  
          # Borders
          { name: :border_top_1,    properties: { border: { style: :thin,   color: 'FF000000', edges: [:top, :bottom, :left, :right] } } },
          { name: :border_top_2,    properties: { border: { style: :medium, color: 'FF000000', edges: [:top, :bottom, :left, :right] } } },
  
          # Number formats
          {
            name: :number, properties: {
              format_code: '#,##0.00'
            }
          },
          {
            name: :int_number, properties: {
              format_code: '#,##0'
            }
          },
  
          # Date formats
          {
            name: :date, properties: {
              format_code: 'DD/MM/YYYY'
            }
          },
  
          # Text colors
          {
            name: :red_text, properties: {
              fg_color: 'FF0000'
            }
          },
  
          # Custom presets
          {
            name: :report_title, properties: {
              sz: 14,
              b: true,
              alignment: { vertical: :center, horizontal: :center },
              height: 30
            }
          },
          {
            name: :report_subtitle, properties: {
              sz: 12,
              b: true,
              alignment: { vertical: :center, horizontal: :center },
              height: 20
            }
          },
          { 
            name: :table_header, properties: {
              b: true, 
              alignment: { vertical: :center, horizontal: :center }, 
              height: 20,
              bg_color: '2196F3', fg_color: 'FF'
            }
          },
          {
            name: :table_footer, properties: {
              b: true,
              alignment: { vertical: :center, horizontal: :center },
              height: 20,
              bg_color: '2196F3', fg_color: 'FF'
            }
          }
        ]
      end
    end
  end
end