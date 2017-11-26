class Address < ApplicationRecord
  require 'csv'
  geocoded_by :full_address
  after_validation :geocode, :if => :address_changed?
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

  def full_address
    "#{address}, #{city}, #{state}, #{zip}"
  end
end
