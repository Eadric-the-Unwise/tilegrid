extends KinematicBody2D
#git
#onready var player := $Player
onready var move_timer := $MoveTimer

# "8x8 cell
var cell_size := 48
# "16x16" unit
var unit_size := 96
var spawn_point := Vector2(8.0, 12.0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Note: You cannot set this value with time_left(). To change the timer's remaining time, use start().
	# Set move timer to 0.0
	move_timer.start(0.0)
	# Set player starting position
	position = spawn_point * cell_size

func _process(_delta: float) -> void:
	if move_timer.time_left == 0.0:
		_move_player()
	
	
func _move_player():
	var direction := Vector2.ZERO
	direction.x = Input.get_axis("move_left", "move_right")
	direction.y = Input.get_axis("move_up", "move_down")
	
	if direction != Vector2(0.0, 0.0):
		position += direction * unit_size
		move_timer.start()
		print(position / cell_size)
	
