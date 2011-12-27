DEBUG = false

module ReadableRegex
  class Pattern
    class << self
      attr_accessor :pattern
      
      ReadableRegex::Definitions::TOKENS.each_pair do |method_name, token|
        define_method(method_name) do
          puts method_name if DEBUG
          @pattern << token
        end
      end
      
      ReadableRegex::Definitions::QUANTIFIERS.each_pair do |method_name, quantifier|
        define_method(method_name) do |to_quantify = '', &block|
          puts method_name if DEBUG
          if block_given?
            instance_eval(&block)
          else
            @pattern << to_quantify
          end
          @pattern << quantifier
        end
      end
      
      def rr(&block)
        @pattern = ''
        instance_eval(&block)
        self
      end
      
      def literal(lit)
        puts "literal #{lit}" if DEBUG
        @pattern << lit.to_s
        nil
      end
      
      def brackets(&block)
        puts "brackets" if DEBUG
        @pattern << '['
        instance_eval(&block)
        @pattern << ']'
      end
      
      def repeat(number_of_times, to_repeat = nil, &block)
        puts "repeat #{number_of_times}, #{to_repeat}" if DEBUG
        if block_given?
          block_return = instance_eval(&block) #TODO: ADD TEST FOR THIS
          @pattern << block_return if block_return.is_a? String
        else
          @pattern << to_repeat
        end

        string_to_insert = case number_of_times
          when Range then [number_of_times.begin, number_of_times.end].join ','
          when Numeric then number_of_times.to_i
        end
        # binding.pry
        @pattern << ['{', string_to_insert, '}'].join
      end
      
      def at_least(number_of_times, to_repeat = nil, &block)
        puts "At LEAST #{number_of_times}, #{to_repeat}" if DEBUG
        if block_given?
          block_return = instance_eval(&block)
          @pattern << block_return if block_return.is_a? String
        else
          @pattern << to_repeat.to_s
        end
        @pattern << ['{', number_of_times, ',}'].join
      end

      def to_s
        pattern
      end

      def r
        Regexp.new(self.to_s)
      end
      
    end
  end
end