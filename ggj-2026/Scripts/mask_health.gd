extends ProgressBar

func _process(delta: float) -> void:
	#if Input.is_key_pressed(KEY_0):
		#Global.HasMask = true
	if Global.HasMask:
		if !Global.InGame:
			show()
			value -= 5 * delta
		else:
			hide()
	else:
		hide()


@warning_ignore("shadowed_variable_base_class")
func _on_value_changed(value: float) -> void:
	if value == 0:
		Global.HasMask = false

func _refill():
	value = 100
