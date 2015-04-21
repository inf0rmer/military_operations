require_relative "./military_operations/version"
require "blanket"
require "nokogiri"

module MilitaryOperations

  def self.urls
    ["List_of_military_operations", "List_of_World_War_II_military_operations"]
  end

  def self.operations(size)
    names = urls.map { |url| get_page_text url }
                .map { |text| Nokogiri::HTML text }
                .flat_map { |page| names_from_page page }

    names.sample size
  end

  private

  def self.names_from_page(page)
    page.css("li i a").collect(&:text).reject(&:empty?)
  end

  def self.get_page_text(name)
    wikipedia = Blanket.wrap "http://en.wikipedia.org/w/api.php"

    wikipedia.get(params: {
      action: "parse",
      format: "json",
      prop:   "text",
      page:   name
    }).parse.text["*"]
  end
end
