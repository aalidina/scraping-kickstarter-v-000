require 'nokogiri'# require libraries/modules here
require 'pry'

# projects: kickstarter.css("li.project.grid_4")
# title: project.css("h2.bbcard_name strong a").text
#image: project.css("div.project-thumbnail a img").attribute("src").value
#project.css("p.bbcard_blurb").text
#project.css("ul.project-meta li a span.location-name").text
#project.css("ul.project-stats li.funded strong").text.gsub("%","").to_i
def create_project_hash
# This just opens a file and reads it into a variable
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)
  projects = {}
  #iterate through project

  kickstarter.css("li.project.grid_4").each do |project|
    title = project.css("h2.bbcard_name strong a").text
  projects[title.to_sym] = {
    :image_link => project.css("div.project-thumbnail a img").attribute("src").value,
   :description => project.css("p.bbcard_blurb").text,
    :location => project.css("ul.project-meta li a span.location-name").text,
      :percent_funded => project.css("ul.project-stats li.funded strong").text.gsub("%","").to_i
  }
  end
  # return the projects hash
  projects
end
