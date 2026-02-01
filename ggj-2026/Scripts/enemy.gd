extends Area3D

signal refill

var prompt_up = false

func _ready() -> void:
	$"../KillPrompt".hide()

func _on_body_entered(body: Node3D) -> void:
	if body.get_name() == "Player":
		$"../KillPrompt".show()
		prompt_up = true

func _on_body_exited(body: Node3D) -> void:
	if body.get_name() == "Player":
		$"../KillPrompt".hide()
		prompt_up = false

func _physics_process(_delta: float) -> void:
	if prompt_up:
		if Input.is_action_just_pressed("Kill"):
			$Scream.play()
			position = Vector3(0,-1000,0)
			emit_signal("refill")
			$"../KillPrompt".hide()
