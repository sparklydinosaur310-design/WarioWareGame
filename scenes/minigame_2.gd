extends Node2D
@onready var timer: RichTextLabel = $Timer

var time: float
var garlics_clicked := 0

func _ready() -> void:
	Timer(15.0)

func _process(delta: float) -> void:
	timer.text = str(snapped(time, 0.10))

func Timer(start_time: float):
	time = start_time
	while time > 0.0:
		await wait(0.10)
		time -= 0.10
	get_tree().call_deferred("change_scene_to_file", "res://scenes/lose_screen.tscn")

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout

func _on_button_1_pressed() -> void:
	$Button_1.hide()
	garlics_clicked += 1
	check_win()

func _on_button_2_pressed() -> void:
	$Button_2.hide()
	garlics_clicked += 1
	check_win()

func _on_button_3_pressed() -> void:
	$Button_3.hide()
	garlics_clicked += 1
	check_win()

func check_win() -> void:
	if garlics_clicked >= 3:
		get_tree().call_deferred("change_scene_to_file", "res://scenes/win_screen.tscn")
