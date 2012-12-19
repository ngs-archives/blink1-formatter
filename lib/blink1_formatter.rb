require 'blink1'
require "rspec/core/formatters/base_formatter"

class Blink1Formatter < RSpec::Core::Formatters::BaseFormatter

  COLOR_SUCCESS = [0,   255, 35]
  COLOR_PENDING = [255, 200,  0]
  COLOR_FAIL    = [255,  10, 30]

  def example_passed(example)
    self.color= COLOR_SUCCESS if self.color.eql?(COLOR_SUCCESS)
    super(example)
  end

  def example_pending(example)
    self.color= COLOR_PENDING unless self.color.eql?(COLOR_FAIL)
    super(example)
  end

  def example_failed(example)
    self.color= COLOR_FAIL
    super(example)
  end

  def dump_summary(duration, example_count, failure_count, pending_count)
    super(duration, example_count, failure_count, pending_count)
    blink1.blink(color[0], color[1], color[2], 2)
    blink1.fade_to_rgb(500, color[0], color[1], color[2])
  end

  def blink1
    unless @blink1
      @blink1 = Blink1.new
      @blink1.open
    end
    @blink1
  end

  def color= c
    unless c.eql?(@color)
      @color = c
      blink1.fade_to_rgb(300, c[0], c[1], c[2])
    end
    c
  end
  
  def color
    @color || COLOR_SUCCESS
  end


end
