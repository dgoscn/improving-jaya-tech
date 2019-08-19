class Issue < ApplicationRecord
    validates_presence_of :number, :github_id
    has_many :events
end
