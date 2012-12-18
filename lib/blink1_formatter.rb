require 'blink1'
require "rspec/core/formatters/base_formatter"

class Blink1Formatter < RSpec::Core::Formatters::BaseFormatter

  COLOR_SUCCESS = [0,   255, 35]
  COLOR_PENDING = [255, 240,  6]
  COLOR_FAIL    = [255,   7, 29]
  
  def example_passed(example)
    unless @color
      @color = COLOR_SUCCESS
      update_color
    end
    super(example)
  end

  def example_pending(example)
    if @color == COLOR_SUCCESS
      @color = COLOR_PENDING
      update_color
    end
    super(example)
  end

  def example_failed(example)
    if @color != COLOR_FAIL
      @color = COLOR_FAIL
      update_color
    end
    super(example)
  end

  def dump_summary(duration, example_count, failure_count, pending_count)
    @blink1.blink(@color[0], @color[1], @color[2], 2)
    @blink1.fade_to_rgb(500, @color[0], @color[1], @color[2])
    super(duration, example_count, failure_count, pending_count)
  end

  private
  
    def update_color
      unless @blink1
        @blink1 = Blink1.new
        @blink1.open
      end
      @blink1.fade_to_rgb(300, @color[0], @color[1], @color[2])
    end


end