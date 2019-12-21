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
    Team.delete_all
    City.delete_all
    City.populate(5) do |city|
      @address = Faker::Address;
      city.name = @address.city
      city.state = @address.state
      city.country = @address.country
      city.timezone = @address.time_zone
      city.postcode = @address.postcode
      Team.populate(2) do |team|
        team.name = Faker::Team.name
        team.city_id = Faker::Number.between(1, 5)
        team.color = Faker::Color.color_name;
        team.year = Faker::Number.between(1950, 2019)
        team.budget = rand(1.0...10.0).round(2)
        team.sponsor_id = Faker::Number.between(1, 10)
      end
    end

    Sponsor.delete_all
    Sponsor.populate(10) do |sponsor|
      sponsor.name = Faker::Beer.name
      sponsor.address = Faker::Address.street_address
      sponsor.payment = Faker::Number.between(10000, 20000)
      sponsor.phone = Faker::PhoneNumber.cell_phone_with_country_code
    end

    Player.delete_all
    Player.populate(30) do |player|
      player.name = Faker::Name.name
      player.team_id = Faker::Number.between(1, 10)
      player.position = Faker::Sports::Basketball.position
      player.nation = Faker::Nation.nationality
      player.birthday = Faker::Date.birthday
      player.height = rand(5.9...7.3).round(1)
      player.weight = Faker::Number.between(170, 250)
    end
  end
end