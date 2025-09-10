extends Node2D

var json_path = "user://saves/data.json"
var data:Dictionary = {}

var sample_data:Dictionary = {
	"current_level" : "res://scenes/levels/lvl_1.tscn",
	"arrow" : false,
	"color" : "R"
}


func _ready() -> void:
	load_file()


func write_file(new_data:Dictionary) -> void:
	var file = FileAccess.open(json_path, FileAccess.ModeFlags.WRITE)
	
	# vérifie l'existence du fichier :
	assert(file, "The file used for saving does not exist.")
	
	var json_text = JSON.stringify(new_data, "\t")
	file.store_string(json_text)
	
	file.close()


func load_file() -> void:
	var file = FileAccess.open(json_path, FileAccess.READ)
	
	# vérifie l'existence du fichier :
	assert(file, "The file used for saving does not exist.")
	
	var json = file.get_as_text()
	var json_object = JSON.new()
	
	json_object.parse(json)
	data = json_object.data
	
	file.close()


func reset_data() -> void:
	data = sample_data
	write_file(data)


func update_level(level:String) -> void:
	data["current_level"] = level
	write_file(data)

#func get_level() :
	#return data["current_level"]


func update_arrow(want_arrow:bool) -> void:
	data["arrow"] = want_arrow
	write_file(data)

#func get_arrow():
	#return data["arrow"]


func update_color(color:String) -> void:
	data["color"] = color
	write_file(data)

#func get_color():
	#return data["current_level"]
