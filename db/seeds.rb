# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Empty the database
# ActiveRecord::Base.connection.tables.each do |table|
#     ActiveRecord::Base.connection.execute("TRUNCATE #{table} RESTART IDENTITY CASCADE") unless table == 'schema_migrations'
# end


# Create an admin user
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?


# Create Store Info
StoreInfo.create!(name: 'Job Board', 
    address: '123 Main St San Francisco CA 94105',
    phone: '415-555-5555',
    email: 'a@b.c',
    logo_url: 'https://images.unsplash.com/photo-1612835365542-0e9a4b6e7b8c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8am9iJTIwcG9zdGluZ3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80',
    about: 'Job Board is a job board website that allows employers to post job listings for a fee. Job seekers can search for jobs and apply to them directly on the website.')


# Create categories [Job Posting, Job Application, Quarterly Analytics, Monthly Analytics, Weekly Analytics]
Category.create!(name: 'Job Posting', description: 'A job posting is a job advertisement created by an employer or their representative to advertise open positions within a company. Job postings can be found on a company’s career page or job board. They are typically created by the employer’s hiring manager or a recruiter who is tasked with filling open positions within the company.')
Category.create!(name: 'Job Application', description: 'A job application is a form that employers ask job seekers to fill out to learn about their work history. Job applications are typically comprised of several sections and fields to allow employers to collect the information they need to make an informed decision.')
Category.create!(name: 'Quarterly Analytics', description: 'Quarterly analytics are a set of metrics that measure a company’s performance over a three-month period. Quarterly analytics are often used to compare a company’s performance to previous quarters or to the same quarter in previous years.')
Category.create!(name: 'Monthly Analytics', description: 'Monthly analytics are a set of metrics that measure a company’s performance over a one-month period. Monthly analytics are often used to compare a company’s performance to previous months or to the same month in previous years.')
Category.create!(name: 'Weekly Analytics', description: 'Weekly analytics are a set of metrics that measure a company’s performance over a one-week period. Weekly analytics are often used to compare a company’s performance to previous weeks or to the same week in previous years.')

# Create 5 products for Job Posting
Product.create!(name: 'Job Posting 1', description: 'Job Posting 1', price_cents: 1100, category_id: 1, image_url: 'https://images.unsplash.com/photo-1612835365542-0e9a4b6e7b8c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8am9iJTIwcG9zdGluZ3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80')
Product.create!(name: 'Job Posting 2', description: 'Job Posting 2', price_cents: 1200, category_id: 1, image_url: 'https://images.unsplash.com/photo-1612835365542-0e9a4b6e7b8c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8am9iJTIwcG9zdGluZ3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80')
Product.create!(name: 'Job Posting 3', description: 'Job Posting 3', price_cents: 1300, category_id: 1, image_url: 'https://images.unsplash.com/photo-1612835365542-0e9a4b6e7b8c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8am9iJTIwcG9zdGluZ3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80')
Product.create!(name: 'Job Posting 4', description: 'Job Posting 4', price_cents: 1400, category_id: 1, image_url: 'https://images.unsplash.com/photo-1612835365542-0e9a4b6e7b8c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8am9iJTIwcG9zdGluZ3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80')
Product.create!(name: 'Job Posting 5', description: 'Job Posting 5', price_cents: 1500, category_id: 1, image_url: 'https://images.unsplash.com/photo-1612835365542-0e9a4b6e7b8c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8am9iJTIwcG9zdGluZ3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80')