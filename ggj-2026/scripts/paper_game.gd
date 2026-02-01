extends Control

var numInBox = 0.0
signal finished

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("paper"):
		if body.inBox != true:
			body.inBox = true
			numInBox += 1

func _process(delta: float) -> void:
	if numInBox == 4:
		print("win")
		emit_signal("finished")
