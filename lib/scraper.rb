require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    web_page = Nokogiri::HTML(open(index_url))
    students = []
    web_page.css("div.student-card").each do |student|
      name = student.css(".student-name").text
      location = student.css(".student-location").text
      profile_page = student.css("a").attribute("href").value
      student_info = {
        :name => name,
        :location => location,
        :profile_url => profile_page
      }
      students << student_info
      end
    students
  end

  def self.scrape_profile_page(profile_url)
    
  end

end

