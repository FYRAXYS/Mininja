extends CharacterBody2D

@onready var tile_map = $"../Tiles/TileMap"
@onready var sprite_2d = $PlayerSkin
var is_moving: bool = false
signal just_moved


func _physics_process(delta: float) -> void:
	if !is_moving :
		return
	
	if global_position == sprite_2d.global_position :
		is_moving = false
		just_moved.emit()
		$MovementTimer.start()
		return 
	else :
		sprite_2d.global_position = sprite_2d.global_position.move_toward(global_position, 4)


func _process(delta: float) -> void:
	if is_moving :
		return 
		
	if Input.is_action_pressed("move_up") :
		move(Vector2.UP)
	elif Input.is_action_pressed("move_down") :
		move(Vector2.DOWN)
	elif Input.is_action_pressed("move_left") :
		move(Vector2.LEFT)
		$PlayerSkin.flip_h = true
	elif Input.is_action_pressed("move_right") :
		move(Vector2.RIGHT)
		$PlayerSkin.flip_h = false
		
	elif Input.is_action_just_pressed("Pass"):
		just_moved.emit()


	if !is_moving :
		$PlayerSkin.animation = "idle"
	elif is_moving :
		$PlayerSkin.animation = "walk"
	$PlayerSkin.play()

func move(direction: Vector2):
	# Get current tile Vector2i
	var current_tile: Vector2 = tile_map.local_to_map(global_position)
	
	# Get the targeted tile Vector2i
	var target_tile: Vector2i = Vector2i (
		current_tile.x + direction.x,
		current_tile.y + direction.y
	)

	# Get the custom data layer from the targeted tile
	var tile_data: TileData = tile_map.get_cell_tile_data(target_tile)

	# Move the player
	if !(tile_data.get_custom_data("walkable")) : # If the tile does not have the walkable custom data
		return 
	else :
		is_moving = true
		global_position = tile_map.map_to_local(target_tile)
		sprite_2d.global_position = tile_map.map_to_local(current_tile)
		
