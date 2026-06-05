extends Area2D

var bounce_height : float = 3.0
var bounce_speed : float = 5.0


@onready var start_pos : Vector2 = global_position
@onready var sprite : Sprite2D = $Sprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var name : String = get_name()
	#print("Testing: " + name)
	return

func _physics_process(delta):
	var time = Time.get_unix_time_from_system()
	var y_pos = ((1 + sin(time * bounce_speed)) / 2) * bounce_height
	global_position.y = start_pos.y - y_pos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body):
	#if not body.is_in_group("Player"):
		#return
	#print("Don't touch me there!")
	if(name.contains("Diamond")):
		body.increase_score(500)
	if (name.contains("Pearl")):
		body.increase_score(100)
	queue_free()
