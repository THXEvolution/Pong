extends RigidBody2D

var velocity: Vector2 = Vector2.ZERO setget setVelocity
export var speed: float = 10.0
export var reflectFactor: float = 0.1
var methodToCall: String = ""
var resetPosition: Vector2 = Vector2(512, 300)
var reset: bool = false

func _ready():
	linear_velocity = velocity.normalized() * speed
	
func _physics_process(delta):
	if methodToCall != "":
		call(methodToCall)
		
func _integrate_forces(state):
	var tform = state.get_transform()
	if reset:
		tform.origin = resetPosition
		reset = false
	state.set_transform(tform)
	
func switchDirection():
	self.velocity = velocity.reflect(Vector2.UP)
	methodToCall = ""
	
func bounceOffWall():
	self.velocity = velocity.bounce(Vector2.UP)
	methodToCall = ""

func setVelocity(value):
	velocity = value
	linear_velocity = velocity.normalized() * speed
