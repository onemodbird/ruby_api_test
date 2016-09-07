require "rspec/expectations"

RSpec::Matchers.define :match_ids_of do |expected|
  define_method :sorted_ids do |list|
    list.map { |item| item["id"] || item[:id] || item.id }.sort
  end

  match { |actual| sorted_ids(actual) == sorted_ids(expected) }

  failure_message do |actual|
    "expected ids '#{sorted_ids(actual)}' to match '#{sorted_ids(expected)}'"
  end

  failure_message_when_negated do |actual|
    "expected ids '#{sorted_ids(actual)}' to not match"
  end
end
