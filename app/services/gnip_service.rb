module GnipService
  module_function

  def rules
    Rules.new(Config.new)
  end

  def history
    History.new(Config.new)
  end
end
