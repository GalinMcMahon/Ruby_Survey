require('spec_helper')

describe(Survey) do
  it("validates presence of description") do
    title = Survey.new({:title => ""})
    expect(title.save()).to(eq(false))
  end

  it("converts the name to title case") do
    survey = Survey.create({:title => "FINAGLE THE BUFFALO"})
    expect(survey.title()).to(eq("Finagle The Buffalo"))
  end
end
