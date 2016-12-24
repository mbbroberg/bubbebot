# Bubbebot 

A daily reminder inspired by the power of community and a childhood of Yiddish. 

### What is it?

A simple script, wrapped up in [this Dockerfile](Dockerfile), designed to be scheduled. 

### But why? 

I wanted to [use botkit](https://github.com/howdyai/botkit/blob/master/readme.md) but found it was overkill for this simple need. I deploy to [iron.io](https://www.iron.io/) so it reminds people everyday.

### Deployment

I followed the guide of [Iron.io ruby/docker deployment](https://github.com/iron-io/dockers/tree/master/ruby) to get started.

### Updating

Specifically: 

```
$ export VERSION="0.0.3"
$ docker build -t mjbrender/bubbebot:$VERSION . 
```

Then push it to DockerHub: 

```
$ docker push mjbrender/bubbebot:$VERSION
```

Then update the scheduled task on Iron.io: 

```
$ export SLACK="xox-your-token"
$ iron worker upload -name bubbebot -e SLACK_API_TOKEN=$SLACK mjbrender/bubbebot:$VERSION
```

Made with :heart: by [@mjbrender](https://twitter.com/mjbrender)

![Bubbebot](http://themenschonabench.com/wp-content/uploads/2016/04/Bubbe_for-web.jpeg)