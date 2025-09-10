extends Node

var _last_scene: Node = null


func _ready():
	print("DiscordManager prêt")
	_last_scene = get_tree().current_scene
	if _last_scene:
		_on_scene_changed(_last_scene)

	DiscordRPC.app_id = 1338905665820688437 # Application ID
	DiscordRPC.details = "Improving the game"
	#DiscordRPC.state = "Somewhere else | "
	
	DiscordRPC.large_image = "icon_large"
	DiscordRPC.large_image_text = "Try the game ! It's free !"
	DiscordRPC.small_image = "icon_small"
	DiscordRPC.small_image_text = "And it's a good game"
	
	#DiscordRPC.party_id = "123"
	DiscordRPC.current_party_size = 0
	DiscordRPC.max_party_size = 4
	#DiscordRPC.join_secret = "123"

	DiscordRPC.start_timestamp = int(Time.get_unix_time_from_system()) # "02:46 elapsed"
	#DiscordRPC.end_timestamp = int(Time.get_unix_time_from_system()) + 3600 # +1 hour in unix time / "01:00:00 remaining"


	refresh()


func _process(_delta: float) -> void:
	DiscordRPC.run_callbacks();
	
	var current = get_tree().current_scene
	if current and current != _last_scene:
		_last_scene = current
		_on_scene_changed(current)

func _on_scene_changed(scene: Node) -> void:
	match scene.name:
		"lvl1":
			change_state("Playing level 1 ")
			#change_level(1)
		"lvl2":
			change_state("Playing level 2 ")
			#change_level(2)
			
		"Menu":
			change_state("In the menu")
			#change_level(0)
		_:
			change_state("Idling")

func change_state(new_state: String) :
	DiscordRPC.state = new_state + " | "
	print("état = " + new_state)
	refresh()

func change_level(level: int) :
	#DiscordRPC.current_party_size = level
	refresh()

func refresh() :
	DiscordRPC.refresh()
