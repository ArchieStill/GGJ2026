extends Control

@onready var health: ProgressBar = $MaskHealth
@onready var sprite: TextureRect = $PlayerSprite
@onready var current_goal: Label = $CurrentGoal


const empty = preload("res://Assets/Sprites/playerspriteempty.png")
const blood = preload("res://Assets/Sprites/playerspriteemptyblood.png")
const full = preload("res://Assets/Sprites/playerspritefull.png")
const threefour = preload("res://Assets/Sprites/playersprite3quart.png")
const half = preload("res://Assets/Sprites/playerspritehalf.png")
const onefour = preload("res://Assets/Sprites/playersprite1quart.png")

func _process(delta: float) -> void:
	if Global.HasMask:
		_maskhealth()
		$DeathClock.text = ""
	else:
		sprite.texture = empty
		$DeathTimer3.start()
	
	match Global.CurrentGoal:
		1: $CurrentGoal.text = "CURRENT GOAL: COMPUTER"
		2: $CurrentGoal.text = "CURRENT GOAL: CONFERENCE"
		3: $CurrentGoal.text = "CURRENT GOAL: BREAK"
		4: $CurrentGoal.text = "CURRENT GOAL: FILING ROOM"

func _maskhealth():
	if health.value > 75:
		sprite.texture = full
	elif health.value <= 75 and health.value > 50:
		sprite.texture = threefour
	elif health.value <= 50 and health.value > 25:
		sprite.texture = half
	else:
		sprite.texture = onefour

func _new_mask():
	health._refill()


func _on_death_timer_3_timeout() -> void:
	$DeathClock.text = "3"
	$DeathTimer2.start()
func _on_death_timer_2_timeout() -> void:
	$DeathClock.text = "2"
	$DeathTimer1.start()
func _on_death_timer_1_timeout() -> void:
	$DeathClock.text = "1"
	$DeathTimer0.start()
func _on_death_timer_0_timeout() -> void:
	get_tree().change_scene_to_file("res://Scenes/over_screen.tscn")
