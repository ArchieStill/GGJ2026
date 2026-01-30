extends Area3D

signal interacted

var menu_up = false
var can_interact = true

func _ready() -> void:
	$"../Prompt".hide()

func _on_body_entered(body: Node3D) -> void:
	if can_interact:
		$"../Prompt".show()
		menu_up = true

func _on_body_exited(body: Node3D) -> void:
	$"../Prompt".hide()
	menu_up = false

func _physics_process(delta: float) -> void:
	if menu_up:
		if Input.is_action_just_pressed("interact"):
			emit_signal("interacted")
			$"../Prompt".hide()
			can_interact = false
			hide()
