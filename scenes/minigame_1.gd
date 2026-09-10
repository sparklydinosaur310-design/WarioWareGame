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
	_on_time_up()

func _on_time_up() -> void:
	get_tree().change_scene_to_file("res://scenes/lose_screen.tscn")

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout

func _on_garlic_garlic_collected() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://scenes/win_screen.tscn")
