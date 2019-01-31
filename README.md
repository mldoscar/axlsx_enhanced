# AxlsxEnhanced

Provides a better way to serialize xlsx documents using axlsx gem. Enhances axlsx styling while building a spreadsheet by ruby code.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'axlsx_enhanced', '~> 0.1.2'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install axlsx_enhanced

## Usage

### Default usage

AxlsxEnhanced uses the same Axlsx syntax, and just injected some useful methods for building a worksheet:

```ruby
document = Axlsx::Package.new do |p|
  # Creates a new worksheet
  # args:
  #  *(built-in Axlsx args)
  #  name:         String, default: ""
  #  smart_styles: Array,  default: AxlsxEnhanced::Helpers::Styles.defaults
  p.workbook.smart_add_worksheet(name: 'Sheet 1') do |sheet|
    # METHOD 1
    ## Sets bold style for all cells
    sheet.smart_add_row ["Cell 1", "Cell 2", "Cell 3"], style: :bold
    
    # METHOD 2
    ## Sets italic style for cell #1 and underline style for cell #2
    sheet.smart_add_row ["Cell 1", "Cell 2"], style: [:italic, :underline]
    
    # METHOD 3
    ## Sets cell styles for specific cells in a row
    row = sheet.smart_add_row ["Cell 1", "Cell 2", "Cell 3"]
    ## Sets bold style for cell #1
    row.cells[0].smart_style = :bold
    ## Sets italic + underline style for cell #3
    row.cells[2].smart_style = [:italic, :underline]
  end

  p.serialize('hello.xlsx')
end
```

### Styles

Styling worksheets are easier now after we created the following structure for it:

```ruby
# Creates a style
style = {
  name: :custom_style,
  properties: {
    b:        true,
    sz:       12,
    fg_color: "FFFFFF",
    bg_color: "004586",
    alignment: {
      horizontal: :center,
      vertical:   :center,
      wrap_text:  true
    },
    border: {
      style: :thick,
      color: "FFFF0000",
      edges: [:top, :bottom]
    }
  }
}
```

For more style properties examples see Axlsx properties examples [in here](https://github.com/randym/axlsx/blob/master/examples/example.rb).

### Using the default style templates
You can use our default style templates while building a worksheet, to see all the available style names check out [this file](https://github.com/mldoscar/axlsx_enhanced/blob/master/lib/axlsx_enhanced/helpers/styles/defaults.rb).

### Create your own style templates

Creating and reusing your own templates now is possible using `smart_styles` option when creating a worksheet as the example given below:

```ruby
# Creates a custom template
my_template = [
  {
    name: :bold_italic,
    properties: {
      b: true, 
      i: true
    }
  },
  {
    name: :center_middle_text,
    properties: {
      alignment: {
        horizontal: :center,
        vertical:   :center
      }
    }
  }
]
```

After that, now we are able to use our custom template:

```ruby
# Use the template in a worksheet
document = Axlsx::Package.new do |p|
  p.workbook.smart_add_worksheet(name: 'Sheet 1', smart_styles: my_template) do |sheet|
    sheet.smart_add_row ["Cell 1", "Cell 2", "Cell 3"], style: :bold_italic
  end
  p.serialize('hello.xlsx')
end
```

**NOTE THAT** using your custom style templates will override our default style template. For combining our style template with yours you can merge the styles in a new variable and the use it for creating a spreadsheet:

```ruby
combined_template  = []

combined_template += my_template
combined_template += AxlsxEnhanced::Helpers::Styles.defaults
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mldoscar/axlsx_enhanced. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the AxlsxEnhanced project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/mldoscar/axlsx_enhanced/blob/master/CODE_OF_CONDUCT.md).
