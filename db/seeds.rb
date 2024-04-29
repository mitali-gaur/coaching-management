Admin.find_or_create_by(email: 'admin@example.com') do |admin|
  admin.password = 'admin@123'
end
