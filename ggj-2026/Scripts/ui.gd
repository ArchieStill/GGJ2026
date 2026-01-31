extends Control

@onready var health: ProgressBar = $MaskHealth
@onready var sprite: TextureRect = $PlayerSprite


const empty = preload("res://Assets/Sprites/playerspriteempty.png")
const blood = preload("res://Assets/Sprites/playerspriteemptyblood.png")
const full = preload("res://Assets/Sprites/playerspritefull.png")
const threefour = preload("res://Assets/Sprites/playersprite3quart.png")
const half = preload("res://Assets/Sprites/playerspritehalf.png")
const onefour = preload("res://Assets/Sprites/playersprite1quart.png")

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
