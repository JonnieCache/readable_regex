tokens = {      :word => '\w',
                :digit => '\d',
                :whitespace => '\s',
                :backspace => '\b', 
                :tab => '\t',
                :line_feed => '\n', 
                :carriage_return => 'r',
                :any_character => '.' }
                
quantifiers = { :optional => '?',
                :any_times => '*',
                :zero_or_more_lazy => '*?',
                :one_or_more => '+',
                :one_or_more_lazy => '+?',
                }
                
class Integer
  def repetitions
    
  end
end

class Pattern
  attr_accessor :pattern
  
  tokens.each_pair do |method_name, token|
    define_method(method_name) do
      @pattern << token
    end
  end
  
  quantifiers.each_pair do |method_name, quantifier|
    define_method(method_name) do |to_quantify = '', &block|
      if block_given?
        instance_eval(&block)
      else
        @pattern << to_quantify
      end
      @pattern << quantifier
    end
  end
  
  def initialize(&block)
    @pattern = ''
    instance_eval(&block)
  end
  
  def literal(lit)
    @pattern << lit
  end
  
  def brackets(&block)
    @pattern << '['
    instance_eval(&block)
    @pattern << ']'
  end
  
  def repetitions(number_of_times, to_repeat, &block)
    if block_given?
      instance_eval(&block)
    else
      @pattern << to_repeat
    end
    @pattern << ['{', number_of_times, '}'].join
  end
  
end

p = Pattern.new do
  literal 'foo'
  brackets do
    literal 'bar'
  end
  literal '2000'
end
