extends Control

var popup:bool = true
var level_path
@onready var text = $"./BeginText"

func _ready() -> void:
	if(FileAccess.file_exists("res://saves/currrent_level.save")) :
		load_data()
	else :
		get_tree().change_scene_to_file("res://scenes/levels/lvl_1.tscn")

func load_data() :
	var file = FileAccess.open("res://saves/currrent_level.save", FileAccess.READ)
	level_path = file.get_var()
	file.close()


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file(level_path)


func _on_level_selection_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/menu_lvls.tscn")


func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/menu_options.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_discord_button_pressed() -> void:
	OS.shell_open("https://discord.gg/yQnmPK5sPt")
