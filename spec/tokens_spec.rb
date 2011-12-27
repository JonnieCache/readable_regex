require 'spec_helper'

describe "singles" do
	it 'renders literal' do
		ReadableRegex::Pattern.rr do
			literal 'foo'
		end.r.should == /foo/
	end

	ReadableRegex::Definitions::TOKENS.each_pair do |name, token|
		it "renders #{token}" do
			ReadableRegex::Pattern.rr do
				send(name)
			end.r.should == /#{token.to_s}/
		end
	end

	ReadableRegex::Definitions::QUANTIFIERS.each_pair do |name, token|
		it "renders #{token}" do
			ReadableRegex::Pattern.rr do
				literal 'foo'
				send(name)
			end.r.should == /foo#{token.to_s}/
		end
	end

end