require('spec_helper')

describe(Survey) do
  it("validates presence of description") do
    title = Survey.new({:title => ""})
    expect(title.save()).to(eq(false))
  end

  it("ensures the length of description is at most 50 characters") do
   survey = Survey.new({:title => "a".*(51)})
   expect(survey.save()).to(eq(false))
 end


  it("converts the name to title case") do
    survey = Survey.new({:title => "FINAGLE THE BUFFALO"})
    survey.save
    expect(survey.title).to(eq("Finagle The Buffalo"))
  end
end
