FactoryGirl.define do
  factory :valid_user, :class => :user do
    email {"user_#{rand(1000).to_s}@example.com"}
    password "12345678"
  end
  
  factory :table do
    number {rand(1000)}
  end
  
  factory :invalid_table, :class => :table do
    number ""
  end

  
  factory :booking1 , :class =>:booking do |f|
    f.table_id 1
    f.user_id 1
    f.start_time "02/09/2017 20:00"
    f.end_time "02/09/2017 20:30"
  end
  
  factory :less_than_one_hour , :class =>:booking do |f|
    f.table_id 1
    f.user_id 1
    f.start_time "02/09/2017 20:50"
    f.end_time "02/09/2017 21:20"
  end
  
   factory :more_than_one_hour , :class =>:booking do |f|
    f.table_id 1
    f.user_id 1
    f.start_time "02/09/2017 20:50"
    f.end_time "02/09/2017 23:20"
  end
  
   factory :booking4 , :class =>:booking do |f|
    f.table_id 1
    f.user_id 1
    f.start_time "02/09/2017 08:00"
    f.end_time "02/09/2017 08:10"
  end
  
  factory :time_gap_booking1 , :class =>:booking do |f|
    f.table_id 1
    f.user_id 1
    f.start_time "01/09/2017 08:00"
    f.end_time "01/09/2017 08:20"
  end
  
  factory :time_gap_booking2 , :class =>:booking do |f|
    f.table_id 1
    f.user_id 2
    f.start_time "01/09/2017 08:10"
    f.end_time "01/09/2017 08:30"
  end
  
   factory :time_gap_same_user_booking1 , :class =>:booking do |f|
    f.table_id 1
    f.user_id 1
    f.start_time "01/09/2017 08:00"
    f.end_time "01/09/2017 08:20"
  end
  
  factory :time_gap_same_user_booking2 , :class =>:booking do |f|
    f.table_id 1
    f.user_id 1
    f.start_time "01/09/2017 08:10"
    f.end_time "01/09/2017 08:30"
  end
  
end