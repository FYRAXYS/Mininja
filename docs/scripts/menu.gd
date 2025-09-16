extends Control

var last_level:String

func _ready() -> void:
	get_tree().paused = false
	

	last_level = SaveManager.data["current_level"]
	
	#DiscordManager.change_state("In the menu")
	#DiscordManager.change_level(0)



func _on_play_pressed():
	if OS.get_name() == "Web":
		get_tree().change_scene_to_file("res://scenes/levels/lvl_1.tscn")
	else:
		get_tree().change_scene_to_file(last_level)


func _on_level_selection_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/menu_lvls.tscn")


func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/menu_options.tscn")


func _on_exit_pressed() -> void:
	if OS.get_name() == "Web":
		get_tree().change_scene_to_file("res://scenes/menus/web_exit.tscn")
	else:
		get_tree().quit()


func _on_discord_button_pressed() -> void:
	OS.shell_open("https://discord.gg/yQnmPK5sPt")
