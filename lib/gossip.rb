require 'csv'

class Gossip
    attr_accessor :author, :content

    def initialize(author, content)
      @author = author
      @content = content
    end

    def save
      CSV.open("./db/gossip.csv", "a+") do |csv|
        csv << [@author, @content]
      end
    end

    def self.all
      gossips = []
      CSV.foreach('./db/gossip.csv') { |row| gossips << Gossip.new(row[0], row[1]) }
      gossips
    end

    def self.find(id)
		  gossips = self.all
		  gossips[id.to_i]
    end

    def self.update(id, author, content)
      gossips = self.all
      gossips[id.to_i].author = author
      gossips[id.to_i].content = content
      CSV.open("db/gossip.csv", "w") { |csv| }
		  CSV.open("db/gossip.csv", "w") { |csv| gossips.each { |gossip| gossip.save }}
    end

end