require 'rails_helper'

module Appo
module Search

describe Preprocessor do

  def grade_level_filter grade_levels
    { terms: { grade_levels: grade_levels } }
  end

  def common_core_filter common_core_tags
    { terms: { common_core_tags: common_core_tags.map(&:downcase) } }
  end

  def content_type_filter(content_types)
    { terms: { content_type: content_types } }
  end

  it "detects 'for ipad'" do
    pp = Preprocessor.new("imovie for ipad")
    expect(pp.query).to eq("imovie")
    expect(pp.filters).to include(content_type_filter(["ios-app"]))
  end

  it "only adds filters and filter values if necessary" do
    pp = Preprocessor.new('math')
    expect(pp.filter_values).to eq({})
  end

  it "detects '1st grade'" do
    pp = Preprocessor.new('1st grade math')
    expect(pp.query).to eq('math')
    expect(pp.filters).to include(grade_level_filter(['1st']))
  end

  it "detects 'first grade'" do
    pp = Preprocessor.new('first grade math')
    expect(pp.query).to eq('math')
    expect(pp.filters).to include(grade_level_filter(['1st']))
  end

  it "detects 'grade 1'" do
    pp = Preprocessor.new('grade 1 math')
    expect(pp.query).to eq('math')
    expect(pp.filters).to include(grade_level_filter(['1st']))
  end

  it "detects 'middle school'" do
    pp = Preprocessor.new('middle school math')
    expect(pp.query).to eq('math')
    expect(pp.filters).to include(grade_level_filter(%w(5th 6th 7th 8th)))
  end

  it "detects 'elementary'" do
    pp = Preprocessor.new('elementary reading')
    expect(pp.query).to eq('reading')
    expect(pp.filters).to include(grade_level_filter(%w(K 1st 2nd 3rd 4th 5th 6th)))
  end

  it "detects common core tags (CCSS.Math.Content.4.NBT.A.1)" do
    common_core_tag = 'CCSS.Math.Content.4.NBT.A.1'
    pp = Preprocessor.new(common_core_tag)
    expect(pp.query).to eq('')
    expect(pp.filters).to include(common_core_filter([common_core_tag]))
    expect(pp.filter_values[:common_core_tags]).to eq([common_core_tag.downcase])
  end

  it "detects multiple common core tags" do
    common_core_tag = 'CCSS.Math.Content.4.NBT.A.1'
    common_core_tag2 = 'CCSS.Math.Content.4.NBT.A.2'
    query = "#{common_core_tag} #{common_core_tag2}"
    filter = common_core_filter([common_core_tag, common_core_tag2])

    pp = Preprocessor.new(query)

    expect(pp.query).to eq('')
    expect(pp.filters).to include(filter)
  end

  it "detects common core tags with ither terms" do
    common_core_tag = 'CCSS.Math.Content.4.NBT.A.1'
    additional_terms = 'math games'
    query = "#{common_core_tag} #{additional_terms}"
    expected_query = additional_terms
    expected_filter = common_core_filter([common_core_tag])

    pp = Preprocessor.new(query)

    expect(pp.query).to eq(expected_query)
    expect(pp.filters).to include(expected_filter)
  end

end

end
end
