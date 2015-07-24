#!/bin/bash
if [ "$(ls -A /home/edenapi )" ]; then
     cd /home/edenapi && git pull
else
    git clone https://github.com/EdenServers/EdenAPI.git /home/edenapi
fi

cd /home/edenapi && bundle install
cd /home/edenapi && RAILS_ENV=production bundle exec rake db:migrate
cd /home/edenapi && foreman start -f Procfile.production
