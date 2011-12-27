guard 'rspec', :version => 2, :cli => '--color --format documentation --fail-fast' do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
  watch('spec/spike_spec.rb')   { "spec" }

  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
  watch('spec/spec_helper.rb')                        { "spec" }
end