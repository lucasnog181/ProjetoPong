extends KinematicBody2D

export var speed = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
   if Input.is_action_pressed("move_up"): move_and_collide(Vector2(0.0, -speed) * delta) 
   elif  Input.is_action_pressed("move_down"): move_and_collide(Vector2(0.0,speed) * delta) 
