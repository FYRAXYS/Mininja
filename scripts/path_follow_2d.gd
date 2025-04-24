extends PathFollow2D

var speed = 0.1
var can_move: bool = false


func _process(delta: float) -> void:
	if (can_move) :
		progress += 32
		can_move = false

func _on_player_just_moved() -> void:
	can_move = true
