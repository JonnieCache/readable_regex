module ReadableRegex
  class Pattern
    attr_accessor :pattern
    
    Definitions::TOKENS.each_pair do |method_name, token|
      define_method(method_name) do
        @pattern << token
      end
    end
    
    Definitions::QUANTIFIERS.each_pair do |method_name, quantifier|
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
    
    def repeat(number_of_times, to_repeat = nil, &block)
      if block_given?
        instance_eval(&block)
      else
        @pattern << to_repeat
      end
      string_to_insert = case number_of_times.class
        when Range then [number_of_times.begin, number_of_times.end].join(',')
        when Integer then number_of_times
      end
      @pattern << ['{', string_to_insert, '}'].join
    end
    
    def at_least(number_of_times, to_repeat = nil, &block)
      if block_given?
        instance_eval(&block)
      else
        @pattern << to_repeat
      end
      @pattern << ['{', number_of_times, ',}'].join
    end
    
  end
end