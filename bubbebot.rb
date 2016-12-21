require 'slack-ruby-client'

Slack.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
  raise 'Missing ENV[SLACK_API_TOKEN]!' unless config.token
end

client = Slack::Web::Client.new
client.auth_test

kibitz = [
  '@channel this is your bubbe here reminding you to help either other during Commitmukkah! Thank you honey.',
  "@channel I know you know what you're doing, but I want to remind you that <http://rogerdudler.github.io/git-guide/|git guide> is a VERY helpful place. Now go commit your code honey!",
  "@channel just write some Markdown today... it's all I ask! Everything you need is <http://www.markdowntutorial.com/|in this tutorial.> Oy veh."
]

i = rand(kibitz.length)

client.chat_postMessage(channel: '#bot-spam', text: kibitz[i], username: 'bubbe')
