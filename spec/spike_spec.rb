# require 'spec_helper'

# describe ReadableRegex do

# 	it 'LIVES!' do

# 		p = ReadableRegex::Pattern.rr do
# 		  literal 'foo'
# 		  brackets do
# 		    literal 'bar'
# 		  end
# 		  literal 2000
# 		  brackets do
# 		    literal 'bar'
# 		    optional
# 		  end
# 		end

# 		pp = p.at_least(3)

# 		puts pp
# 	end
# end