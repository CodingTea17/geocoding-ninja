class Address < ApplicationRecord
  require 'csv'
  belongs_to :jobs

  def self.import(file)
    CSV.foreach(file.path, headers: false) do |row|
      hash = {
        property_id: row[0],
        address: row[1],
        city: row[2],
        state: row[3],
        zip: row[4],
        # user_id: current_user.id,
        # job_id: 
      }
      Address.create!(hash)
    end
  end
end
