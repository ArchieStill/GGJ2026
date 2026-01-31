extends Control

signal finished

var paperInside = 0;
var can_play = false

func _on_box_back_body_entered(body: Node2D) -> void:
	if body.is_in_group("paper"):
		if body._getBox() == false:
			paperInside += 1
			body._setBox(true)

func _on_box_back_body_exited(body: Node2D) -> void:
	if body.is_in_group("paper"):
		if body._getBox() == true:
			paperInside -= 1
			body._setBox(false)

func _process(_delta: float) -> void:
	if paperInside >= 4:
		$EndTimer.start()

func _on_end_timer_timeout() -> void:
	hide()
	emit_signal("finished")
