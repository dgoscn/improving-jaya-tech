class Event < ApplicationRecord
    belongs_to :issue
    validates_presence_of :action
end
