extends Node2D

@onready var timer: RichTextLabel = $timer

var time : float

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	timer.text = str(snapped(time, 0.1))

func Timer(start_time: float):
	time = start_time
	
	while time > 0.0:
		await wait(0.1)
		time = time - 0.1
		
	return
	
func wait(seconds: float):
	await get_tree().create_timer(seconds).timeout
