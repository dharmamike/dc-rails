FROM phusion/passenger-full

#RUN rm -f /root/.ssh/authorized_keys /home/*/.ssh/authorized_keys

ADD config/webapp.conf /etc/nginx/sites-enabled/webapp.conf
RUN mkdir /home/app/webapp
ADD . /home/app/webapp/firstapp
RUN chown -R app:app /home/app/webapp
RUN bundle install --gemfile=/home/app/webapp/firstapp/Gemfile
#RUN rm -f /etc/service/nginx/down
#RUN rm -f /etc/nginx/sites-enabled/default

#CMD ["/sbin/my_init"]
WORKDIR /home/app/webapp/firstapp
CMD bundle exec rails s
