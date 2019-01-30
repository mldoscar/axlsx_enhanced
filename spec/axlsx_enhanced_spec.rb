RSpec.describe AxlsxEnhanced do
  it "has a version number" do
    expect(AxlsxEnhanced::VERSION).not_to be nil
  end

  it "should have all AxlsxEnhanced methods injected" do
    package = Axlsx::Package.new

    # Workbook Injection
    workbook = package.workbook
    expect(workbook).to respond_to(:smart_add_worksheet)

    # Sheet Injection
    sheet = workbook.smart_add_worksheet(name: 'Sheet 1')
    expect(sheet).to respond_to(:smart_add_row)

    # Row Injection
    row = sheet.smart_add_row [
      "Cell 1",
      "Cell 2",
      "Cell 3"
    ], style: :table_header

    # Cell Injection
    expect {
      row.cells[0].smart_style = [:halign_center, :date]
    }.not_to raise_error(Exception)

  end
end
