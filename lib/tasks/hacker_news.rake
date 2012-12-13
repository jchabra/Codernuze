namespace :hacker_news  do
  desc "get hacker news"
  task :getnews => :environment do
    require 'open-uri'
    doc = Nokogiri::HTML(open('http://news.ycombinator.com/newest'))
    links = doc.css('table table tr:nth-child(3n+1) td:nth-child(3) > a')
    links.each do |link|
      record = Link.where(:name => link.content, :url => link.get_attribute('href')).first
      Link.create(:name => link.content, :url => link.get_attribute('href')) if record.nil?
    end
 end
end

#--- Original Example ---#

# namespace :hacker_news do
#   desc 'this is a'
#   task :a => :environment do
#     puts Link.all.count
#   end

#   desc 'this is b'
#   task :b do
#     puts 'bbb'
#   end
  
#   desc 'this is c'
#   task :c do
#     puts 'ccc'
#   end

#   desc 'this is d'
#   task :d => [:b, :c] do #this means that if you run the d task, it will have to run b and c before it can run d. It's dependent on b and c.
#     puts 'ddd'
#   end

# end









