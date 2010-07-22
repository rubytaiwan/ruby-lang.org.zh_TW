require 'rubygems'
require 'RedCloth'

layout_content = File.read("layout.html")

Dir.glob("*.textile").each do |filename|
  content = File.read(filename)
  html = RedCloth.new(content).to_html
  File.open("output/#{filename.gsub('.textile','.html')}", "w") do |f| 
    f << layout_content.gsub("{{ content }}", html)
  end
end