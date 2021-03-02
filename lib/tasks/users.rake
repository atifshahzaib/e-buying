namespace :admin_user do
  desc "create admin user"
  task :create => :environment do 
    User.create(email: "abc123@gmail.com", password: '123', password_confirmation: '123', admin: true )
  end
end