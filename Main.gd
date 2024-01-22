extends Node2D

# set variable after _ready is finished
onready var move_timer := $Player/MoveTimer
#onready var player := $Player
onready var enemy := $Enemy

var move_pattern := [Vector2(0,-1), Vector2(1,0), Vector2(0,1), Vector2(-1,0)]

#onready var old_globalPosition : Vector2 = player.global_position

# "8x8 cell
var cell_size := 48


func _ready() -> void:
	pass
	# checks for signal sent from Player script
	#Autoload.player.connect("player_moved_signal", self, "_check_player_moved")

func _process(delta: float) -> void:
	pass
	#print(old_globalPosition / cell_size)
	
func _check_player_moved():
	pass
