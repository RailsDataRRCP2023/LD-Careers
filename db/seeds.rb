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
StoreInfo.create!(name: 'LD Careers', 
    address: '123 Main St San Francisco CA 94105',
    phone: '415-555-5555',
    email: 'a@b.c',
    logo_url: 'https://images.unsplash.com/photo-1612835365542-0e9a4b6e7b8c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8am9iJTIwcG9zdGluZ3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80',
    about: 'Job Board is a job board website that allows employers to post job listings for a fee. Job seekers can search for jobs and apply to them directly on the website.')


# Create categories [Job Posting, Quarterly Analytics, Monthly Analytics, Weekly Analytics, Job Application]
Category.create!(name: 'Job Posting', description: 'A job posting is a job advertisement created by an employer or their representative to advertise open positions within a company. Job postings can be found on a company’s career page or job board. They are typically created by the employer’s hiring manager or a recruiter who is tasked with filling open positions within the company.')
Category.create!(name: 'Quarterly Analytics', description: 'Quarterly analytics are a set of metrics that measure a company’s performance over a three-month period. Quarterly analytics are often used to compare a company’s performance to previous quarters or to the same quarter in previous years.')
Category.create!(name: 'Monthly Analytics', description: 'Monthly analytics are a set of metrics that measure a company’s performance over a one-month period. Monthly analytics are often used to compare a company’s performance to previous months or to the same month in previous years.')
Category.create!(name: 'Weekly Analytics', description: 'Weekly analytics are a set of metrics that measure a company’s performance over a one-week period. Weekly analytics are often used to compare a company’s performance to previous weeks or to the same week in previous years.')
# Category.create!(name: 'Job Application', description: 'A job application is a form that employers ask job seekers to fill out to learn about their work history. Job applications are typically comprised of several sections and fields to allow employers to collect the information they need to make an informed decision.')

# Create 5 products for Job Posting
Product.create!(name: 'Software Developer', description: 'Software developers design, code, and test computer programs, applications, and systems. They collaborate with teams to create software solutions that meet the needs of users and businesses.', price_cents: 1100, category_id: 1, image_url: 'https://images.unsplash.com/photo-1612835365542-0e9a4b6e7b8c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8am9iJTIwcG9zdGluZ3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80')
Product.create!(name: 'Data Scientist', description: 'Data scientists analyze and interpret complex data sets to inform business decision-making. They utilize statistical techniques and machine learning algorithms to extract valuable insights and patterns from large volumes of data.', price_cents: 1200, category_id: 1, image_url: 'https://images.unsplash.com/photo-1612835365542-0e9a4b6e7b8c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8am9iJTIwcG9zdGluZ3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80')
Product.create!(name: 'Network Administrator', description: 'Network administrators are responsible for maintaining and managing an organization\'s computer networks. They ensure network stability, troubleshoot connectivity issues, and implement security measures to safeguard against cyber threats.', price_cents: 1300, category_id: 1, image_url: 'https://images.unsplash.com/photo-1612835365542-0e9a4b6e7b8c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8am9iJTIwcG9zdGluZ3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80')
Product.create!(name: 'Cybersecurity Analyst', description: 'Cybersecurity analysts protect an organization\'s computer systems and networks from security breaches. They monitor for suspicious activities, implement security measures, and respond to incidents to safeguard sensitive information.', price_cents: 1400, category_id: 1, image_url: 'https://images.unsplash.com/photo-1612835365542-0e9a4b6e7b8c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8am9iJTIwcG9zdGluZ3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80')
Product.create!(name: 'Database Administrator', description: 'Database administrators manage and organize data using specialized software. They design, implement, and maintain databases to ensure efficient data storage, retrieval, and integrity for various applications and systems.', price_cents: 1500, category_id: 1, image_url: 'https://images.unsplash.com/photo-1612835365542-0e9a4b6e7b8c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8am9iJTIwcG9zdGluZ3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80')

# Create 2 products for Quarterly Analytics
Product.create!(name: '2023 Q1 Analytics', description: 'Job/career analytics involves the use of data analysis and statistical methods to gain insights into various aspects of the job market and career trends. Professionals in this field utilize data-driven approaches to understand employment patterns, skill requirements, and industry trends, helping organizations and individuals make informed decisions about career development and workforce planning.', price_cents: 2100, category_id: 2, image_url: 'https://images.unsplash.com/photo-1612835365542-0e9a4b6e7b8c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8am9iJTIwcG9zdGluZ3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80')
Product.create!(name: '2023 Q2 Analytics', description: 'Job/career analytics involves the use of data analysis and statistical methods to gain insights into various aspects of the job market and career trends. Professionals in this field utilize data-driven approaches to understand employment patterns, skill requirements, and industry trends, helping organizations and individuals make informed decisions about career development and workforce planning.', price_cents: 2200, category_id: 2, image_url: 'https://images.unsplash.com/photo-1612835365542-0e9a4b6e7b8c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8am9iJTIwcG9zdGluZ3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80')

# Create 2 products for Monthly Analytics
Product.create!(name: 'Nov 2023 Monthly Analytics', description: 'Job/career analytics involves the use of data analysis and statistical methods to gain insights into various aspects of the job market and career trends. Professionals in this field utilize data-driven approaches to understand employment patterns, skill requirements, and industry trends, helping organizations and individuals make informed decisions about career development and workforce planning.', price_cents: 3100, category_id: 3, image_url: 'https://www.entrepreneur.com/article/364823')
Product.create!(name: 'Dec 2023 Monthly Analytics', description: 'Job/career analytics involves the use of data analysis and statistical methods to gain insights into various aspects of the job market and career trends. Professionals in this field utilize data-driven approaches to understand employment patterns, skill requirements, and industry trends, helping organizations and individuals make informed decisions about career development and workforce planning.', price_cents: 3200, category_id: 3, image_url: 'https://www.entrepreneur.com/article/364823')

# Create 2 products for Weekly Analytics
Product.create!(name: 'Weekly Analytics Nov 17-23 2023', description: 'Job/career analytics involves the use of data analysis and statistical methods to gain insights into various aspects of the job market and career trends. Professionals in this field utilize data-driven approaches to understand employment patterns, skill requirements, and industry trends, helping organizations and individuals make informed decisions about career development and workforce planning.', price_cents: 4100, category_id: 4, image_url: 'https://www.entrepreneur.com/article/364823')
Product.create!(name: 'Weekly Analytics Nov 24-30 2023', description: 'Job/career analytics involves the use of data analysis and statistical methods to gain insights into various aspects of the job market and career trends. Professionals in this field utilize data-driven approaches to understand employment patterns, skill requirements, and industry trends, helping organizations and individuals make informed decisions about career development and workforce planning.', price_cents: 4200, category_id: 4, image_url: 'https://www.entrepreneur.com/article/364823')

# Provincial Taxes
ProvinceTax.create!(name: 'Alberta', gst: 0.05, pst: 0)
ProvinceTax.create!(name: 'British Columbia', gst: 0.05, pst: 0.07)
ProvinceTax.create!(name: 'Manitoba', gst: 0.05, pst: 0.07)
ProvinceTax.create!(name: 'New Brunswick', gst: 0.05, pst: 0.10)
ProvinceTax.create!(name: 'Newfoundland and Labrador', gst: 0.05, pst: 0.10)
ProvinceTax.create!(name: 'Northwest Territories', gst: 0.05, pst: 0)
ProvinceTax.create!(name: 'Nova Scotia', gst: 0.05, pst: 0.10)
ProvinceTax.create!(name: 'Nunavut', gst: 0.05, pst: 0)
ProvinceTax.create!(name: 'Ontario', gst: 0.05, pst: 0.08)
ProvinceTax.create!(name: 'Prince Edward Island', gst: 0.05, pst: 0.1)
ProvinceTax.create!(name: 'Quebec', gst: 0.05, pst: 0.09975)
ProvinceTax.create!(name: 'Saskatchewan', gst: 0.05, pst: 0.06)
ProvinceTax.create!(name: 'Yukon', gst: 0.05, pst: 0)