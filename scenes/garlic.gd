extends Node2D

signal garlic_collected

func _on_area_2d_body_entered(body: Node2D) -> void:
	print("touched: ", body.name)
	print("groups: ", body.get_groups())
	if body.is_in_group("player"):
		emit_signal("garlic_collected")
		hide()
