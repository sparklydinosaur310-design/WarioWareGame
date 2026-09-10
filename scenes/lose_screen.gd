extends Node2D
@onready var label: RichTextLabel = $RichTextLabel

func _ready() -> void:
	label.text = "You Lose!"
	Global.lives -= 1
	Global.minigames_done -= 1
	await get_tree().create_timer(1.5).timeout
	if Global.lives <= 0:
		get_tree().change_scene_to_file("res://scenes/title_screen.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/level_screen.tscn")
