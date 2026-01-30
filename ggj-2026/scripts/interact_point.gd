extends Area3D

var menu_up = false

func _ready() -> void:
	$"../Prompt".hide()

func _on_body_entered(body: Node3D) -> void:
	$"../Prompt".show()
	menu_up = true

func _on_body_exited(body: Node3D) -> void:
	$"../Prompt".hide()
	menu_up = false

func _physics_process(delta: float) -> void:
	if menu_up:
		if Input.is_action_just_pressed("interact"):
			print("interact")
