FROM node:10.4
MAINTAINER morike

RUN npm install -g coffeescript yo generator-hubot hubot-scripts
RUN useradd -m hubot # -m ... make home dir

USER hubot
RUN mkdir -p /home/hubot/rocketbot
WORKDIR /home/hubot/rocketbot

# use --build-arg to change default value
ARG BOT_NAME="rocketbot"
ARG BOT_OWNER="No owner specified"
ARG BOT_DESC="Hubot with rocketbot adapter"

RUN yo hubot --adapter="rocketchat" --name="$BOT_NAME" --owner="$BOT_OWNER" --description="$BOT_DESC" --default

CMD bin/hubot -a rocketchat
