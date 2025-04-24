extends CharacterBody2D

@onready var raycast: RayCast2D = $PointLight2D/Area2D/RayCast2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	# situation = le joueur est détecté dans la zone de portée max de la lumière (sans compter les murs)
	var playerPos = Vector2(body.get_global_position()[0], body.get_global_position()[1])
	#raycast.set_target_position(playerPos)
	print(raycast.get_collider())
	
	if raycast.is_colliding() :
		if raycast.get_collider().get_class() ==  "CharacterBody2D":
			print("////////// JOUEUR DETECTE //////////////")


#func _on_area_2d_body_exited(body: Node2D) -> void:
	#raycast.set_target_position(Vector2(0,50))
	#raycast.look_at(Vector2(0,0))
