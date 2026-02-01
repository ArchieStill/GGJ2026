extends Area3D

signal typing
signal simonsays
signal coffee
signal filing

@export var minigame = ""

var menu_up = false
var can_interact = true

func _ready() -> void:
	$"../../Prompt".hide()

func _on_body_entered(body: Node3D) -> void:
	if body.get_name() == "Player":
		if can_interact:
			$"../../Prompt".show()
			menu_up = true

func _on_body_exited(body: Node3D) -> void:
	if body.get_name() == "Player":
		$"../../Prompt".hide()
		menu_up = false

func _physics_process(_delta: float) -> void:
	if menu_up:
		if Input.is_action_just_pressed("interact") and can_interact:
			match minigame:
				"TYPING": emit_signal("typing")
				"SIMONSAYS": emit_signal("simonsays")
				"COFFEE": emit_signal("coffee")
				"FILING": emit_signal("filing")
			$"../../Prompt".hide()
			can_interact = false
			hide()
