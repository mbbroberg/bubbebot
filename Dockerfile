FROM iron/ruby

RUN apk add && apk update
RUN gem install slack --no-ri --no-rdoc
RUN rm -rf /var/cache/apk/*

WORKDIR /app
ADD . /app

ENTRYPOINT ["ruby", "bubbebot.rb"]
