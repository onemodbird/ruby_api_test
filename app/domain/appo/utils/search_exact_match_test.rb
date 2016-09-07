module Appo
module Utils
class SearchExactMatchTest

  def self.run num = 100
    failures = []

    resources = Resource.where(defunct_at: nil)
                        .where(kind: %w(app video webpage))
                        .where.not(name: nil)
                        .order('random()')
                        .limit(num)
                        .pluck(:name)

    resources.each do |test_name|
      result_name = Appo::Search::ResourceSearchAPI.new(test_name, [], [], 1)
                                                   .search
                                                   .results
                                                   .first
                                                   .fetch('name')

      if test_name != result_name
        failures << [test_name, result_name]
      end
    end

    pass_count = resources.size - failures.size

    puts
    puts "FAILURES:\n#{failures.map(&:inspect).join("\n")}"
    puts
    puts "#{failures.size} Failures from #{resources.size} tests"
    puts ("%.2f%% Success rate" % (pass_count.to_f / resources.size * 100))
    puts
  end

end
end
end
