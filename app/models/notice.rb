class Notice < ApplicationRecord
    
    def self.recent_one
        self.order(:created_at).first.content
    end
    
    def self.recent_date
        self.order(:created_at).first.created_at
    end
    
end
