namespace :admin do
  desc "Creates the Admin User"
  task create: :environment do
    email = ENV['email'] || 'admin@admin.com'
    password = ENV['password'] || 'password'

    User.create(first_name: "Admin",
                last_name: "User",
                email: email,
                password: password)
  end
end
