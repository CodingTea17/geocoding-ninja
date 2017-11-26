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

  def self.to_csv(job_id)
    CSV.generate(headers: false) do |csv|
      all.each do |address|
        if address.job_id === job_id
          csv << [ address.property_id, address.latitude, address.longitude ]
        end
      end
    end
  end

  def full_address
    "#{address}, #{city}, #{state}, #{zip}"
  end
end
