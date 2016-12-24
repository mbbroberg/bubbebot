require_relative 'bundle/bundler/setup'
require 'slack-ruby-client'

Slack.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
  raise 'Missing ENV[SLACK_API_TOKEN]!' unless config.token
end

client = Slack::Web::Client.new
client.auth_test

# Syntax in order to @channel that I find too messy to have in each kibitz
# Reference: https://api.slack.com/docs/message-formatting#variables
at_channel = '<!channel|channel>'

# The messages we could share in the channel. Contributions welcome here! 
#  Just copy/paste one of the existing lines (be sure to have a comma between them)
#  and create links using the <URL|link> syntax.
kibitz = [
  "#{at_channel} this is your bubbe here reminding you to help either other during Commitmukkah! Thank you honey.",
  "#{at_channel} I know you know what you're doing, but I want to remind you that <http://rogerdudler.github.io/git-guide/|git guide> is a VERY helpful guide to learn git commands. Now go commit your code honey!",
  "#{at_channel} just write some Markdown today... it's all I ask! Everything you need is <http://www.markdowntutorial.com|in this git guide>! Oy veh.",
  "#{at_channel} stop your kvetching and commit something!",
  "#{at_channel} a pig remains a pig, until it learns to use git",
  "#{at_channel} you can contribute even if you don't have the time to write a PR by reviewing open Issues and PRs. Git commenting!"
]

i = rand(kibitz.length)

# Notes on flags: 
#  :channel to be specific (accepts name or ID)
#  :text randomized 
#  :as_user to true so name/pic taken from bot's profile
client.chat_postMessage(channel: '#commitmukkah', text: kibitz[i], as_user: true)
