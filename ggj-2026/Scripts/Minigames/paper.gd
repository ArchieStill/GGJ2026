extends RigidBody2D

var dragging = false
var of = Vector2.ZERO

func _process(delta: float) -> void:
	if dragging:
		position = get_global_mouse_position() - of

func _on_button_button_down() -> void:
	dragging = true
	of = get_global_mouse_position() - global_position
	gravity_scale = 0.0

func _on_button_button_up() -> void:
	linear_velocity = Vector2.ZERO
	angular_velocity = 0.0
	dragging = false
	gravity_scale = 1.0
