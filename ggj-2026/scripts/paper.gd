extends RigidBody2D

var dragging = false
var of = Vector2.ZERO

var insideBox = false

func _process(delta: float) -> void:
	if dragging:
		position = get_global_mouse_position() - of

func _on_button_button_down() -> void:
	dragging = true
	of = get_global_mouse_position() - global_position
	gravity_scale = 0.0

func _on_button_button_up() -> void:
	dragging = false
	gravity_scale = 1.0
	
func _setBox(newState):
		insideBox = newState

func _getBox() -> bool:
	return insideBox
