extends Control

var reset_level_path = "res://scenes/levels/lvl_1.tscn"
@onready var arrow_button = $MarginContainer/VBoxContainer/HBoxArrow/Arrow

func _ready() -> void:
	arrow_button.set_pressed_no_signal(SaveManager.data["arrow"])

func _on_reset_pressed() -> void:
	SaveManager.reset_data()

func _on_arrow_pressed() -> void:
	SaveManager.update_arrow(!SaveManager.data["arrow"])

func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/menu.tscn")
