extends Area3D

signal typing
signal simonsays
signal coffee
signal folder
signal paper

@export var minigame = ""

var menu_up = false
var can_interact = true

func _ready() -> void:
	$"../../Prompt".hide()

func _on_body_entered(_body: Node3D) -> void:
	if can_interact:
		$"../../Prompt".show()
		menu_up = true

func _on_body_exited(_body: Node3D) -> void:
	$"../../Prompt".hide()
	menu_up = false

func _physics_process(_delta: float) -> void:
	if menu_up:
		if Input.is_action_just_pressed("interact") and can_interact:
			match minigame:
				"TYPING": emit_signal("typing")
				"SIMONSAYS": emit_signal("simonsays")
				"COFFEE": emit_signal("coffee")
				"FOLDER": emit_signal("folder")
				"PAPER": emit_signal("paper")
			$"../../Prompt".hide()
			can_interact = false
			hide()
