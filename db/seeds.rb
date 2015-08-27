class Seed
  def self.start
    seed = Seed.new
    seed.generate_locations
    seed.generate_roles
    seed.generate_users
    seed.generate_listings
    seed.generate_reservations
  end

  def places
    ['North America',
     'South America',
     'Europe',
     'Africa',
     'Asia',
     'Australia',
     'Antarctica']
  end


  def role_types
    ['registered_user',
     'business_admin',
     'platform_admin']
  end

  def generate_locations
    places.each do |place|
      Location.create!(continent: place)
    end
  end

  def generate_roles
    role_types.each do |type|
      Role.create!(title: type)
    end
  end

  def generate_users
    25.times do |i|
      user = User.create!(username: "Registered_user_#{i}", password_digest: 'password')
      puts "User: #{user.username} created!"
    end

    5.times do |i|
      platform_admin = User.create!(username: "platform_admin_#{i}", password_digest: 'password')
      puts "User: #{platform_admin.username} created!"
    end

  end

  def location_ids
    (1..7).to_a.sample
  end


  def generate_listings
    25.times do |i|
      business_admin = User.create!(username: "business_admin_#{i}", password_digest: 'password')
      business_admin.update!(host_id: business_admin.id)
      puts "User: #{business_admin.username} created!"

      listing = Listing.create!(location_id:          location_ids,
                                cost:                 100.00,
                                name:                 "name_#{i}",
                                image_file_name:      "image_file_name_#{i}",
                                image_content_type:   "image_content_type_#{i}",
                                image_file_size:      i,
                                image_updated_at:     Date.today,
                                gmaps:                [true, false].sample,
                                lat:                  i,
                                long:                 i,
                                number_of_guests:     (1..8).to_a.sample,
                                host_id:              business_admin.id)
      puts "Listing: Listing with host #{business_admin.id} created!"
    end
  end

  def generate_reservations
    10.times do |i|
      Reservation.create!(user_id:      User.first(10).sample.id,
                          status:       ['Ordered', 'Paid', 'Completed'].sample,
                          listing_id:   Listing.first(10).sample.id,
                          start_date:   "",
                          end_date:     ""
                         )
    end

  end

end

Seed.start
