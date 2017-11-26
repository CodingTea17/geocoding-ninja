class Address < ApplicationRecord
  require 'csv'
  belongs_to :job, optional: true

  def self.import(file, job_id)
    CSV.foreach(file.path, headers: false) do |row|
      hash = {
        property_id: row[0],
        address: row[1],
        city: row[2],
        state: row[3],
        zip: row[4],
        job_id: job_id
      }
      Address.create!(hash)
    end
  end
end
