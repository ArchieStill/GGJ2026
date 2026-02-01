extends CharacterBody3D

var sp_nums = []
var spots = []
var patrol = -1
var patrol_max

var waiting = true
@onready var pause = $Timer1
@onready var freeze = $Timer2
@onready var attent = $Timer3

var shocked = false
var chasing = false
var target

@onready var nav_agent: NavigationAgent3D = $NavigationAgent3D
@onready var catcher = $Catchball/CollisionShape3D

var mask

const walk = 5.0
const chase = 7.5

func _ready() -> void: #setup
	var spot_root = get_node("/root/Game/People/NavigationRegion3D/Points")
	mask = preload("res://Scenes/mask_refill.tscn")
	var nums = ((self.get_name()).split("-"))
	for i in nums:
		sp_nums.append(int(i))
	sp_nums.pop_front()
	print(sp_nums)
	catcher.set_disabled(true)
	for i in sp_nums:
		spots.append(spot_root.get_child(i))
	patrol_max = sp_nums.size()
	_point_reached()
	pass

func _navigate(target : Vector3): #sets new target location for npc
	nav_agent.set_target_position(target)
	pass

func _wander(pos : Node3D):
	_navigate(pos.get_position())
	pass

func _point_reached():
	if waiting:
		patrol += 1
		if patrol >= patrol_max:
			patrol = 0
		_wander(spots[patrol])
		waiting = false
	pass

func _reach_check(now, next):
	if (snapped(abs(now.z), 0.01) == snapped(abs(next.z), 0.01)):
		if (snapped(abs(now.x), 0.01) == snapped(abs(next.x), 0.01)):
			if chasing == false:
				waiting = true
				if pause.is_stopped():
					pause.start()
			elif target != null:
				_navigate(target.get_position())
		elif waiting:
			waiting = false
	elif waiting:
		waiting = false

func _physics_process(delta: float) -> void: #moves npc
	if !shocked:
		if not is_on_floor():
			velocity += get_gravity() * delta
		var now_pos = Vector3(self.get_global_position())
		var next_pos = Vector3(nav_agent.get_next_path_position())
		var direction = now_pos.direction_to(next_pos)
		var speed = walk
		if chasing:
			speed = chase
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
		_reach_check(now_pos, next_pos)
		move_and_slide()
		if !Vector3().cross(Vector3(next_pos)).is_zero_approx():
			print("halp")
			self.look_at(next_pos)

func _on_area_entered(body: Node3D) -> void:
	if body.get_name() == "Player":
		#get disguise status
		var disguise = false
		if !disguise:
			_navigate(body.get_position())
			catcher.set_deferred("disabled", false)
			if !shocked and !chasing:
				shocked = true
				target = body
				freeze.start()

func _on_area_exited(body: Node3D) -> void:
	if body.get_name() == "Player":
		if chasing:
			target = null

func _start_chase():
	shocked = false
	chasing = true

func _lose_chase():
	chasing = false
	_point_reached()

func _catch(body: Node3D) -> void: #for when person collider hits player
	if chasing:
		print("gotcha")
	pass

func _taken(area: Area3D): #for when player kills person
	var masky = mask.instantiate()
	get_node("/root/Game").add_child(masky)
	get_node("/root/Game/maskRefill").set_global_position(area.get_global_position())
	self.queue_free()
	pass
