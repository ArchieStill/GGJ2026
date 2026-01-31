extends CharacterBody3D

var sp_nums = [0,1,2]
var spots = []
var patrol = 0
var patrol_max

var shocked = false

@onready var nav_agent: NavigationAgent3D = $NavigationAgent3D
@onready var catcher = $Catchball/CollisionShape3D

const SPEED = 5.0

func _ready() -> void: #setup
	var spot_root = get_node("/root/Node3D/People/NavigationRegion3D/Points")
	catcher.set_disabled(true)
	for i in sp_nums:
		spots.append(spot_root.get_child(i))
	patrol_max = sp_nums.size()
	pass

func _navigate(target : Vector3): #sets new target location for npc
	nav_agent.set_target_position(target)
	pass

func _wander(pos : Node3D):
	_navigate(pos.get_position())
	pass

func _physics_process(delta: float) -> void: #moves npc
	#if !shocked:
	_navigate(Vector3(10,0,10))
	if not is_on_floor():
		velocity += get_gravity() * delta
	var now_pos = Vector3(self.get_global_position())
	var next_pos = Vector3(nav_agent.get_next_path_position())
	var direction = now_pos.direction_to(next_pos)
	print(direction)
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	move_and_slide()

func _on_area_entered(body: Node3D) -> void:
	#get disguise status
	var disguise = false
	if !disguise:
		_navigate(body.get_position())
		catcher.set_deferred("disabled", false)
		#shocked = true
	pass

func _catch(): #for when person collider hits player
	pass

func _taken(): #for when player kills person
	self.queue_free()
	pass
