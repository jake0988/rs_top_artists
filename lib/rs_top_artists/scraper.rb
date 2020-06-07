class RsTopArtists::Scraper
    @@all = []

    def self.scrape_artists
        url = 'https://www.rollingstone.com/interactive/lists-100-greatest-songwriters/'
        doc = Nokogiri::HTML(open(url))
        names = doc.css("div.touching-underline-style h1.account-name")
        information = doc.css("article.account div.account-body")
        names.zip(information).each do |name, info|
            name = name.text
            info = info.text.strip.gsub(/\s+/, " ")
            RsTopArtists::Artist.new(name, info)
        end
     end