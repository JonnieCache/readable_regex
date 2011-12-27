require 'spec_helper'

describe ReadableRegex do
	it 'renders brackets' do
		ReadableRegex::Pattern.rr do
			brackets {literal 'foo'}
		end.r.should == /[foo]/
	end
end