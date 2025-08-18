extends Node

func _ready():
	DiscordRPC.app_id = 1338905665820688437 # Application ID
	DiscordRPC.details = "Improving the game"
	#DiscordRPC.state = "Somewhere else | "
	
	DiscordRPC.large_image = "icon_large"
	DiscordRPC.large_image_text = "Try the game ! It's free !"
	DiscordRPC.small_image = "icon_small"
	DiscordRPC.small_image_text = "And it's a good game"
	
	#DiscordRPC.party_id = "123"
	DiscordRPC.current_party_size = 1
	DiscordRPC.max_party_size = 4
	#DiscordRPC.join_secret = "123"

	DiscordRPC.start_timestamp = int(Time.get_unix_time_from_system()) # "02:46 elapsed"
	#DiscordRPC.end_timestamp = int(Time.get_unix_time_from_system()) + 3600 # +1 hour in unix time / "01:00:00 remaining"

	refresh()

func change_state(new_state: String) :
	DiscordRPC.state = new_state + " | "
	refresh()

func change_level(level: int) :
	DiscordRPC.current_party_size = level
	refresh()

func refresh() :
	DiscordRPC.refresh()
