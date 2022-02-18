extends RigidBody2D

var velocity: Vector2 = Vector2(10.0, 0.0)
export var speed: float = 10.0
export var reflectFactor: float = 0.1
var methodToCall: String = ""

func _ready():
	linear_velocity = velocity.normalized() * speed
	
func _physics_process(delta):
	linear_velocity = velocity.normalized() * speed
	
	if test(position):
		velocity = velocity.bounce(Vector2.UP)
	
	if methodToCall != "":
		call(methodToCall)
	
func switchDirection():
	velocity = velocity.reflect(Vector2.UP)
	methodToCall = ""
