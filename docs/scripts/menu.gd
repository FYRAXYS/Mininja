extends Control

var level_path

func _ready() -> void:
	get_tree().paused = false
	
	if(FileAccess.file_exists("res://ressources/saves/currrent_level.save")) :
		load_data()
	else :
		level_path = "res://scenes/levels/lvl_1.tscn"
	
	DiscordManager.change_state("In the menu")
	DiscordManager.change_level(0)

func load_data() :
	var file = FileAccess.open("res://ressources/saves/currrent_level.save", FileAccess.READ)
	level_path = file.get_var()
	file.close()


func _on_play_pressed():
	get_tree().change_scene_to_file(level_path)


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
