FROM phusion/passenger-ruby24:0.9.33

ENV HOME /root

CMD ["/sbin/my_init"]

RUN rm -f /etc/service/nginx/down
RUN rm /etc/nginx/sites-enabled/default

ADD app.conf /etc/nginx/sites-enabled/app.conf

WORKDIR /home/app/sunny_blog
COPY --chown=app:app . .

RUN gem install bundler
RUN bundle install --without development
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
