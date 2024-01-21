extends KinematicBody2D

onready var move_timer := $MoveTimer

# "8x8 cell
var cell_size := 48
# "16x16" unit
var unit_size := 96
var spawn_point := Vector2(12.0, 8.0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Set player starting position
	position = spawn_point * cell_size
	
	
func _move_enemy():
	pass
	
