extends Node2D

@onready var sprite = $Sprite2D
@onready var area = $Area2D
signal button_pressed


func _on_area_2d_body_entered(body: Node2D) -> void:
	button_pressed.emit()
	sprite.texture = load("res://images/button_blue.png")
