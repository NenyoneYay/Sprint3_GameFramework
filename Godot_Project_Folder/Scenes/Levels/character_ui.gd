extends CanvasLayer

@onready var score_text : Label = $ScoreText
@onready var player = get_parent()


func _update_score(score : int):
	score_text.text = "Score: " + str(score)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.OnUpdateScore.connect(_update_score)
	_update_score(PlayerStats.score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
