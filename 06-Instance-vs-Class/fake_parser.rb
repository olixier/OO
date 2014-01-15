class FakeParser

  def self.start(text, &block)
    block.call(FakeParser.new(text))
  end

  def initialize(text)
    @text = text 
  end

  def begin_parsing
    puts "Parsing beginning...."
  end

  def parse
    10.times {puts "Fake parsing of '#{@text}' in course.."}
  end

  def end_parsing
    puts "End of Parsing ! sorry for the result. That was a fake :)"
  end

end

FakeParser.start("some_text.txt") do |p|
  p.begin_parsing
  p.parse
  p.end_parsing
end