extends CharacterBody3D

var sp_nums = [0,1,2]
var spots = []
var patrol = -1
var patrol_max

var waiting = true
@onready var pause = $Timer1
@onready var freeze = $Timer2

var shocked = false
var chasing = false

@onready var nav_agent: NavigationAgent3D = $NavigationAgent3D
@onready var catcher = $Catchball/CollisionShape3D

const walk = 5.0
const chase = 7.5

func _ready() -> void: #setup
	var spot_root = get_node("/root/Node3D/People/NavigationRegion3D/Points")
	var nums = (self.get_name()).split("-")
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
			waiting = true
			if pause.is_stopped():
				pause.start()
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
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
		_reach_check(now_pos, next_pos)
		move_and_slide()

func _on_area_entered(body: Node3D) -> void:
	#get disguise status
	var disguise = false
	if !disguise:
		_navigate(body.get_position())
		catcher.set_deferred("disabled", false)
		if !shocked and !chasing:
			shocked = true
			freeze.start()
	pass

func _start_chase():
	shocked = false
	chasing = true

func _catch(): #for when person collider hits player
	pass

func _taken(): #for when player kills person
	self.queue_free()
	pass
