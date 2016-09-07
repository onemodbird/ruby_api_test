module TextHelper
  def indefinite_articlerize(word)
    word.match(/^[aeiou]/) ? "an #{word}" : "a #{word}"
  end
end

