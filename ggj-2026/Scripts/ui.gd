extends Control

@onready var health: ProgressBar = $MaskHealth
@onready var sprite: TextureRect = $PlayerSprite


const empty = preload("res://Assets/playerspriteempty.png")
const blood = preload("res://Assets/playerspriteemptyblood.png")
const full = preload("res://Assets/playerspritefull.png")
const threefour = preload("res://Assets/playersprite3quart.png")
const half = preload("res://Assets/playerspritehalf.png")
const onefour = preload("res://Assets/playersprite1quart.png")

func _process(delta: float) -> void:
	if Global.HasMask:
		_maskhealth()
	else:
		sprite.texture = empty

func _maskhealth():
	if health.value > 75:
		sprite.texture = full
	elif health.value <= 75 and health.value > 50:
		sprite.texture = threefour
	elif health.value <= 50 and health.value > 25:
		sprite.texture = half
	else:
		sprite.texture = onefour
