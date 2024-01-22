extends KinematicBody2D

export var move_pattern := [Vector2.ZERO, Vector2.ZERO, Vector2.ZERO, Vector2.ZERO]
var index : int = 0
# "8x8 cell
var cell_size := 48
# "16x16" unit
var unit_size := 96
export var spawn_point := Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Set player starting position
	position = spawn_point
	Autoload.connect("PlayerMovedSignal", self, "_on_Player_Moved")

func _on_Player_Moved():
	position += move_pattern[index % 4] * unit_size
	index += 1
	print("Enemy Index: " + str(index% 4))
	
