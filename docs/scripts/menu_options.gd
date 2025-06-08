extends Control

@onready var lvl1 = $Levels/lvl1/Marker2D
@onready var lvl2 = $Levels/lvl2/Marker2D
@onready var lvl3 = $Levels/lvl3/Marker2D
@onready var player = $PlayerSelection
var selected_level = ""


func _on_lvl_1_mouse_entered() -> void:
	player.set_global_position(lvl1.get_global_position())
	selected_level = "res://scenes/levels/lvl_1.tscn"

func _on_lvl_2_mouse_entered() -> void:
	player.set_global_position(lvl2.get_global_position())
	selected_level = "res://scenes/levels/lvl_2.tscn"

func _on_lvl_3_mouse_entered() -> void:
	player.set_global_position(lvl3.get_global_position())
	selected_level = "res://scenes/levels/lvl_3.tscn"


func _on_play_pressed() -> void:
	if selected_level != "" :
		get_tree().change_scene_to_file(selected_level)
