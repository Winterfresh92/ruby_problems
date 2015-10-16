require 'jumpstart_auth'
require 'bitly'

class MicroBlogger
	attr_reader :client

	def initialize
		puts "Initializing MicroBlogger..."
		Bitly.use_api_version_3
		@client = JumpstartAuth.twitter
	end

	def tweet(message)
		if message.length <= 140
			@client.update(message)
		else
			puts "The tweet is too long"
		end
	end

	def dm(target, message)
		puts "Trying to send #{target} this direct message:"
		puts message
		message = "d @#{target} #{message}"
		screen_names = @client.followers.collect { |follower| @client.user(follower).screen_name }
		if screen_names.include? target
			tweet(message)
		else
			puts "You can only dm people who follow you"
		end
	end

	def followers_list
		screen_names = []
		@client.followers.each do |follower|
			screen_names << @client.user(follower).screen_name
		end
		screen_names
	end

	def spam_my_followers(message)
		followers_list.each do |name|
			dm(name, message)
		end
	end

	def everyones_last_tweet
		friends = friends_by_screen_name(@client.friends)
		friends.each do |friend|
			last_message = @client.user(friend).status.text
			timestamp = @client.user(friend).status.created_at
			puts "#{@client.user(friend).screen_name} said this on #{timestamp.strftime("%A, %b %d")}..."
			puts last_message
			puts ""
		end
	end

	def friends_by_screen_name(friends)
		friends = friends.sort_by do |friend|
			@client.user(friend).screen_name.downcase
		end
		friends
	end

	def shorten(original_url)
		bitly = Bitly.new('hungryacademy', 'R_430e9f62250186d2612cca76eee2dbc6')
		new_url = bitly.shorten(original_url)
		puts "Shortening this URL: #{original_url}"
		puts new_url.short_url
		new_url.short_url
	end

	def run
		puts "Welcome to the JSL Twitter Client!"
		input = ""
		while input != "q"
			printf "enter command: "
			input = gets.chomp
			parts = input.split(" ")
			command = parts[0]
			case command
			when "q" then puts "Goodbye!"
			when "t" then tweet(parts[1..-1].join(" "))
			when "dm" then dm(parts[1], parts[2..-1].join(" "))
			when "spam" then spam_my_followers(parts[1..-1].join(" "))
			when "elt" then everyones_last_tweet
			when "s" then shorten(parts[1])
			when "turl" then tweet(parts[1..-2].join(" ") + " " + shorten(parts[-1]))
			else
				puts "Sorry, I don't know how to #{command}"
			end
		end
	end
end

blogger = MicroBlogger.new
blogger.run