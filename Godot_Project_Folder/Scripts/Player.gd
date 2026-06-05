extends CharacterBody2D

@export var move_speed : float = 200
@onready var sprite : Sprite2D = $Sprite
@onready var weapon_origin : Node2D = $Weapon
@onready var swordpoint : Node2D = $Weapon/Swordpoint

signal OnUpdateScore (score: int)

func increase_score(amount: int):
	PlayerStats.score += amount
	OnUpdateScore.emit(PlayerStats.score)
	print(PlayerStats.score)

func _physics_process(delta):
	var move_input : Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = move_input * move_speed
	move_and_slide()

func _process(delta):
	var mouse_pos : Vector2 = get_global_mouse_position()
	var mouse_dir : Vector2 = (mouse_pos - global_position).normalized()
	weapon_origin.rotation_degrees = rad_to_deg(mouse_dir.angle()) + 90
	
	
