module ReadableRegex
  module Definitions
   TOKENS = { :word => '\w',
              :digit => '\d',
              :whitespace => '\s',
              :backspace => '\b', 
              :tab => '\t',
              :line_feed => '\n', 
              :carriage_return => 'r',
              :any_character => '.' }
                  
    QUANTIFIERS = { :optional => '?',
                    :any_times => '*',
                    :zero_or_more_lazy => '*?',
                    :one_or_more => '+',
                    :one_or_more_lazy => '+?',
                    }
  end
end