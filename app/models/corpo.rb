class Corpo < ApplicationRecord
    has_many :carros
    

    def self.reflete(a)
        puts a
        puts 'self method'
    end
end
