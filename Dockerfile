FROM philipssoftware/node:lts

LABEL maintainer="Jeroen Knoops <jeroen.knoops@philips.com>"
LABEL maintainer="Brend Smits <brend.smits@philips.com>"

WORKDIR /app
COPY . /app

RUN yarn global remove lerna && yarn cache clean

RUN git clone --depth=1 https://github.com/philips-forks/repolinter.git 
RUN cd repolinter && npm i --production && cd ..

ENTRYPOINT ["/app/bin/loop.sh"]
