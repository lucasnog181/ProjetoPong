extends KinematicBody2D

export var velocite = Vector2(500.0,0.0)
export var rebound_intensity = 100

signal player_score(index)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	var collision = move_and_collide(velocite * delta)
	if collision:
		if collision.collider.is_in_group("wall"):
			velocite.y*= -1
			$CollisionSound.play()
			
		elif collision.collider.is_in_group("Left wall"):
			emit_signal("player_score" , 2)
			reset()
		
		elif collision.collider.is_in_group("Right wall"):
			emit_signal("player_score" , 1)
			reset()
			
		elif collision.collider.is_in_group("paddle"):
			velocite.y = y_from_collision(collision)
			velocite.x*= -1
			$CollisionSound.play()
			
		elif collision.collider.is_in_group("paddleIA"):
				velocite.y = y_from_collision(collision)	
				velocite.x*= -1
				$CollisionSound.play()		
	
func reset():
	position = Vector2(482.5 , 285)	
	
func y_from_collision(collision):
	var paddle_y_extent = collision.collider.get_node("CollisionShape2D").shape.extents.y
	var normalized_value = (position.y - collision.collider.position.y)/paddle_y_extent
	return normalized_value * rebound_intensity


