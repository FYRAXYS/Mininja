extends Control

@onready var lvl1 = $Levels/lvl1/Marker2D
@onready var lvl2 = $Levels/lvl2/Marker2D
@onready var lvl3 = $Levels/lvl3/Marker2D
@onready var player = $PlayerSelection
@onready var camera = $PlayerSelection/Camera2D
@onready var buttonPlay = $PlayerSelection/Play

var selected_level = ""
var max_zoom = Vector2(2,2)
var min_zoom = Vector2(-2,-2)


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("scroll_up") && camera.get_zoom() <= max_zoom :
		camera.set_zoom(camera.get_zoom()+Vector2(0.5,0.5))
	elif Input.is_action_just_pressed("scroll_down") && camera.get_zoom() >= min_zoom:
		camera.set_zoom(camera.get_zoom()+Vector2(-0.5,-0.5))




func _on_lvl_1_mouse_entered() -> void:
	player.set_global_position(lvl1.get_global_position())
	selected_level = "res://scenes/levels/lvl_1.tscn"
	buttonPlay.visible = true

func _on_lvl_2_mouse_entered() -> void:
	player.set_global_position(lvl2.get_global_position())
	selected_level = "res://scenes/levels/lvl_2.tscn"
	buttonPlay.visible = true


func _on_lvl_3_mouse_entered() -> void:
	player.set_global_position(lvl3.get_global_position())
	selected_level = "res://scenes/levels/lvl_3.tscn"
	buttonPlay.visible = true



func _on_play_pressed() -> void:
	if selected_level != "" :
		get_tree().change_scene_to_file(selected_level)
