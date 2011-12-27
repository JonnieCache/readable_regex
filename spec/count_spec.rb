require 'spec_helper'

describe "counting" do
	it 'renders at least 3 without block' do
		ReadableRegex::Pattern.rr do
			at_least 3, 'foo' 
		end.r.should == /foo{3,}/
	end

	it 'renders at least 3 with block' do
		ReadableRegex::Pattern.rr do
			at_least(3) {literal 'foo'}
		end.r.should == /foo{3,}/
	end

	it 'renders repeat exactly 3 without block' do
		ReadableRegex::Pattern.rr do
			repeat 3, 'foo' 
		end.r.should == /foo{3}/
	end

	it 'renders repeat exactly 3 with block' do
		ReadableRegex::Pattern.rr do
			repeat(3) {'foo'}
		end.r.should == /foo{3}/
	end

	it 'renders repeat 3 to 6 without block' do
		ReadableRegex::Pattern.rr do
			repeat 3..6, 'foo' 
		end.r.should == /foo{3,6}/
	end

	it 'renders repeat 3 to 6 with block' do
		ReadableRegex::Pattern.rr do
			repeat(3..6) {'foo'}
		end.r.should == /foo{3,6}/
	end
end