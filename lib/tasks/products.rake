namespace :products do
  desc "create default products data"
  task :create => :environment do 
    2.times do
      pro = Product.create(name: "Product", price: 190, quantity: 5)
      pro.avatar.attach(io: File.open(Rails.root.join("app", "assets", "images", "image1.jpeg")), filename: 'image1.jpeg')
      pro = Product.create(name: "Product", price: 200, quantity: 6)
      pro.avatar.attach(io: File.open(Rails.root.join("app", "assets", "images", "image2.jpeg")), filename: 'image1.jpeg')
      pro = Product.create(name: "Product", price: 300, quantity: 4)
      pro.avatar.attach(io: File.open(Rails.root.join("app", "assets", "images", "image3.jpeg")), filename: 'image1.jpeg')
      pro = Product.create(name: "Product", price: 490, quantity: 2)
      pro.avatar.attach(io: File.open(Rails.root.join("app", "assets", "images", "image1.jpeg")), filename: 'image1.jpeg')
    end
  end
end
