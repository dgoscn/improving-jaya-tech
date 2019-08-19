class Issue < ApplicationRecord
    validates_presence_of :title, :number, :github_id
    has_many :events
end
