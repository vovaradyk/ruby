module Populator
  # Builds multiple Populator::Record instances and saves them to the database
  class Factory
    def rows_sql_arr
      @records.map do |record|
        quoted_attributes = record.attribute_values.map { |v| @model_class.connection.quote(v) }
        "(#{quoted_attributes.join(', ')})"
      end
    end
  end
end

require 'faker'

namespace :tasks do
  desc "description"
  task filltables: :environment do

    City.populate(25) do |city|
      @address = Faker::Address;
      city.name = @address.city
      city.state = @address.state
      city.country = @address.country
      city.timezone = @address.time_zone
      city.postcode = @address.postcode
    end

    Company.populate(20) do |company|
      company.name = Faker::Company.name
      company.city_id = Faker::Number.between(1, 20)
      company.address = Faker::Address.street_address
      company.phone = Faker::PhoneNumber.cell_phone_with_country_code
      company.year = Faker::Number.between(1950, 2019)
    end

    Delivery.delete_all

    Delivery.populate(20) do |delivery|
      delivery.name = Faker::House.furniture
      delivery.city_id = Faker::Number.between(1, 20)
      delivery.company_id = Faker::Number.between(1, 20)
      delivery.date = Faker::Time.between(DateTime.now - 150, DateTime.now)
      delivery.price =  Faker::Number.between(100, 10000)
    end

end
end