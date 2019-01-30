# AxlsxEnhanced

Provides a better way to serialize xlsx documents using axlsx gem.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'axlsx_enhanced'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install axlsx_enhanced

## Usage

```ruby
document = Axlsx::Package.new do |p|
    # Creates a new worksheet
    # args:
    #  *(built-in Axlsx args)
    #  name:         String, default: ""
    #  smart_styles: Array,  default: AxlsxEnhanced::Helpers::Styles.defaults
    p.workbook.smart_add_worksheet(name: 'Sheet 1') do |sheet|
        # Universal styling for all cells
        sheet.smart_add_row ["Simple cell value"], style: :bold
        
        # Universal styling for each cells
        sheet.smart_add_row ["Cell 1", "Cell 2"], style: [:italic, :underlined]
        
        # Manual styling
        row = sheet.smart_add_row ["Cell 1", "Cell 2"]
        row.cells[0].smart_style = :bold
        row.cells[1].smart_style = [:italic, :underlined]
    end

    p.serialize('hello.xlsx')
end
```

You can see default styles in **[this file](https://github.com/[USERNAME]/axlsx_enhanced/blob/master/lib/axlsx_enhanced/helpers/styles/defaults.rb)**


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/axlsx_enhanced. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the AxlsxEnhanced project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/axlsx_enhanced/blob/master/CODE_OF_CONDUCT.md).
