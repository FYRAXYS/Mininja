extends Control

@onready var progress_bar = $MarginContainer/VBoxContainer/ProgressBar
@onready var popup = $"."
var time_left = 100

func _process(_delta: float) -> void:
	progress_bar.value = time_left
	time_left -= 0.3
	
	if progress_bar.value <= 0 :
		popup.hide()
