extends CharacterBody2D

@export var move_speed : float = 80

@onready var sprite : Sprite2D = $Sprite
@onready var player : CharacterBody2D

var player_direction : Vector2
var player_distance : float

func _ready():
	pass
	#player = get_tree().get_first_node_in_group("player")
	player = get_tree().get_first_node_in_group("Player")

func _die ():
	queue_free()

func _physics_process(_delta):
	player_direction = global_position.direction_to(player.global_position)
	player_distance = global_position.distance_to(player.global_position)
	
	velocity = player_direction * move_speed
	move_and_slide()



func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		body.take_damage()
