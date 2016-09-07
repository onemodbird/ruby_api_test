module Appo
module Search
class Preprocessor

  def initialize(input_query)
    @input_query = input_query.to_s
    @output_query = @input_query.dup
    @filter_values = {}
    process
  end

  def filters
    @filter_values.map do |k, v|
      { terms: { k => v } }
    end
  end

  def query
    @output_query
  end

  def filter_values
    @filter_values
  end

  private

  def process
    process_grade_levels
    process_grade_level_groups
    process_common_core_tags
    process_for_ipad
  end

  def grade_levels
    {
      'Pre-K' => ['prek', 'pre-k'],
      'K' => ['kindergarten'],
      '1st' => ['1st grade', 'first grade', 'grade 1'],
      '2nd' => ['2nd grade', 'second grade', 'grade 2'],
      '3rd' => ['3rd grade', 'third grade', 'grade 3'],
      '4th' => ['4th grade', 'fourth grade', 'grade 4'],
      '5th' => ['5th grade', 'fifth grade', 'grade 5'],
      '6th' => ['6th grade', 'sixth grade', 'grade 6'],
      '7th' => ['7th grade', 'seventh grade', 'grade 7'],
      '8th' => ['8th grade', 'eighth grade', 'grade 8'],
      '9th' => ['9th grade', 'ninth grade', 'grade 9'],
      '10th' => ['10th grade', 'tenth grade', 'grade 10'],
      '11th' => ['11th grade', 'eleventh grade', 'grade 11'],
      '12th' => ['12th grade', 'twelfth grade', 'grade 12']
    }
  end

  def grade_level_groups
    [
      [ %w(Pre-K K), ['early childhood'] ],
      [ %w(K 1st 2nd 3rd 4th 5th 6th), ['elementary', 'elementary school'] ],
      [ %w(5th 6th 7th 8th), ['middle school'] ],
      [ %w(9th 10th 11th 12th), ['high school'] ]
    ]
  end

  def common_core_tags
    @output_query.scan(CommonCore.regex).flatten
  end

  def process_grade_levels
    process_strings grade_levels
  end

  def process_grade_level_groups
    process_strings grade_level_groups
  end

  def process_common_core_tags
    common_core_tags.each do |string|
      if query_matches?(string)
        filter_for(:common_core_tags, string.downcase)
        remove_string_from_query(string)
      end
    end
  end

  def process_strings mappings
    mappings.each do |grade_levels, strings|
      strings.each do |string|
        if query_matches?(string)
          Array(grade_levels).each do |grade_level|
            filter_for(:grade_levels, grade_level)
          end
          remove_string_from_query(string)
        end
      end
    end
  end

  def process_for_ipad
    string = "for ipad"
    if query_matches?(string)
      remove_string_from_query(string)
      filter_for(:content_type, "ios-app")
    end
  end

  def query_matches?(string)
    @output_query =~ /\b#{string}\b/i ? true : false
  end

  def remove_string_from_query(string)
    @output_query.gsub!(/\b#{string}\b/i, '')
    @output_query.gsub!(/\s{2,}/, ' ')
    @output_query.strip!
  end

  def filter_for(field, value)
    @filter_values[field] ||= []
    @filter_values[field] << value
  end

end
end
end
