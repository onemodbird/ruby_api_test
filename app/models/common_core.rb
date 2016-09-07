class CommonCore

  DATA_FILE = "#{Rails.root}/config/common_core.json"

  def self.load!
    @all = []
    JSON.parse(File.read(DATA_FILE)).each do |attrs|
      @all << new(attrs).freeze
    end
    @all.freeze

    # Create a regex from common core names that can be used for determining
    # if a (search) string contains a common core identifier.  I'm sure this
    # method of construction could be improved upon b/c a number of the
    # branches produced start the same way. Separately, this could match
    # identifiers that don't acutally exist.
    re = @all.map(&:name)
             .map{|n| n.split('.') }
             .group_by(&:size)
             .map{|k,v|
               v.reduce([]){|agg,ns|
                 ns.each_with_index{|n,i|
                   agg[i] ||= []
                   agg[i] << n unless agg[i].include?(n)
                 }
                 agg
               }.map{|n|
                 ['(?:', n.join('|'), ')'].join
               }.join('\.')
             }
             .map{|r| "(?:#{r})"}
             .join("|")
    @regex = /(?:\b(#{re})\b)+/

    @loaded = true
  end

  def self.loaded?
    !!@loaded
  end

  def self.all
    @all
  end

  def self.regex
    @regex
  end


  attr_reader :guid, :name, :uri, :description, :grade_levels

  def initialize(attrs)
    @guid = attrs.fetch('guid')
    @name = attrs.fetch('name')
    @uri = attrs.fetch('uri')
    @description = attrs.fetch('description')
    @grade_levels = attrs.fetch('grade_levels')
  end
end

CommonCore.load! unless CommonCore.loaded?
