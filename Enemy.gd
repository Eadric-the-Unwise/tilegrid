extends KinematicBody2D

onready var area := $Area2D
var health := 10
# movement pattern array
export var move_pattern := [Vector2.ZERO, Vector2.ZERO, Vector2.ZERO, Vector2.ZERO]
var index : int = 0
# "8x8 cell
var cell_size := 48
# "16x16" unit
var unit_size := 96
# enemy tracking in enemy_list (main.gd)
var tracking_index := 0

# in the Inspector
export var spawn_point := Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Set player starting position
	#position = spawn_point
	Autoload.connect("PlayerMovedSignal", self, "_on_player_moved")
	Autoload.connect("PlayerAttackSignal", self, "_on_player_attacked")
	area.connect("body_entered", self, "_on_Area2D_body_entered")

func _on_Area2D_body_entered(_body: Node2D):
	print("BODY ENTERED")

func _on_player_moved():
	position += move_pattern[index % 4] * unit_size
	index += 1
	#print("Enemy Index: " + str(index% 4))
	

func _on_player_attacked(damage: int):
	health -= damage
	print("Enemy takes " + str(damage) + " damage!")
	if health <= 0:
		queue_free()
		print("Enemy dies!")
		Autoload.player.in_combat = false
		
