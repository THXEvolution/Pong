extends RigidBody2D

export var velocity: Vector2 = Vector2(10.0, 0.0)
export var reflectFactor: float = 0.1
var methodToCall: String = ""

func _ready():
	linear_velocity = velocity
	
func _physics_process(delta):
	linear_velocity = velocity
	if methodToCall != "":
		call(methodToCall)
	
func switchDirection():
	velocity = velocity.reflect(Vector2.UP)
	methodToCall = ""
