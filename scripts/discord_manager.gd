extends Node

func _ready():
	DiscordRPC.app_id = 1338905665820688437 # Application ID
	DiscordRPC.details = "Testing Levels"
	
	DiscordRPC.large_image = "icon"
	DiscordRPC.large_image_text = "discord.gg/yQnmPK5sPt"
	

	DiscordRPC.start_timestamp = int(Time.get_unix_time_from_system()) # "02:46 elapsed"
	# DiscordRPC.end_timestamp = int(Time.get_unix_time_from_system()) + 3600 # +1 hour in unix time / "01:00:00 remaining"

	DiscordRPC.refresh() # Always refresh after changing the values!
