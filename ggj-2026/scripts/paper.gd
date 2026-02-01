extends RigidBody2D

var selected = false
var inBox = false

func _on_button_button_down() -> void:
	selected = true

func _physics_process(delta: float) -> void:
	if (selected):
		var direction = get_global_mouse_position() - global_position
		var distance = global_position.distance_to(get_global_mouse_position())
		linear_velocity = direction * distance
		
func _on_button_button_up() -> void:
	selected = false
