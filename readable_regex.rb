

p = Pattern.new do
  literal 'foo'
  brackets do
    literal 'bar'
  end
  literal '2000'
  brackets do
    literal 'bar'
    optional
  end.at_least.three_times
end
