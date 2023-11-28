docker build -t my-ruby-app:ldcareers .
docker run -p 3000:3000 -p 5432:5432 -it --rm --name my-running-app-rails my-ruby-app:ldcareers
