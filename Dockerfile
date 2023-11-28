FROM ruby:3.1.2

RUN apt update
RUN apt upgrade -y

RUN apt install rbenv -y

RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt install -y nodejs yarn

RUN echo 'export PATH="$PATH:`yarn global bin`"' >> ~/.bashrc

RUN gem install rails rubocop rubocop-rails solargraph -N
RUN rbenv rehash

WORKDIR /usr/src/app

COPY . .
RUN gem install bundler && bundle config set --local path 'vendor/cache' && bundle install

EXPOSE 3000

RUN rm -f tmp/pids/server.pid

RUN rails db:migrate --trace
RUN rails db:seed --trace

CMD ["rails", "s", "-b", "0.0.0.0"]
# CMD ["bash"]