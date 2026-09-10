extends Node2D
@onready var timer: RichTextLabel = $timer

var time: float

func _ready() -> void:
	Timer(15.0)

func _process(delta: float) -> void:
	timer.text = str(snapped(time, 0.10))

func Timer(start_time: float):
	time = start_time
	while time > 0.0:
		await wait(0.10)
		time -= 0.10
	_on_time_up()  # <-- this is the missing piece

func _on_time_up() -> void:
	timer.text = "Time's up!"
	Global.lives -= 1
	Global.minigames_done -= 1  # cancel out the increment level_screen did to get here
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file("res://scenes/level_screen.tscn")

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout

func _on_garlic_garlic_collected() -> void:
	timer.text = "You got the garlic!"
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file("res://scenes/level_screen.tscn")
