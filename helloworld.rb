require 'rubygems'
require 'mechanize'

a = Mechanize.new

a.get('http://google.fr/') do |page|
search_result = page.form_with(:name => 'f') do |search|
search.q = 'vincent nussbaum'
end.submit

search_result.links.each do |link|
puts link.text
end
end