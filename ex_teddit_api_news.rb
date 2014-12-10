# We're going to add a remote data source to pull in stories from Mashable and Digg.
  # http://mashable.com/stories.json
  # http://digg.com/api/news/popular.json
# These stories will also be upvoted based on our rules. No more user input!

# Pull the json, parse it and then make a new story hash out of each story(Title, Category, Upvotes)
# Add each story to an array and display your "Front page"


# require 'json'
require 'rest-client'
require 'pry'
require 'pry-byebug'
require 'json'

def get_stories
	# binding.pry
	stories_hash = JSON.load(RestClient.get("http://www.reddit.com/.json"))
	stories_array = stories_hash["data"]["children"]

	story_collection = [] #array - story collection
		
		stories_array.each do |child|
			my_story = {}
			my_story[:title] = child["data"]["title"]
			my_story[:upvotes] = child["data"]["score"]
			# story_collection.push(my_story)
			story_collection << my_story
			# binding.pry
			# title = child["data"]["title"]
			# upvotes = child["data"]["score"]
		end
	story_format(story_collection)

	# binding.pry
end

def story_format(story_collection)
	story_collection.each do |story|
		puts "Title: #{story[:title]}, Upvotes: #{story[:upvotes]}"
		end

end

get_stories	 