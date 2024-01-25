extends Node2D

# set variable after _ready is finished
onready var move_timer := $Player/MoveTimer
#onready var player := $Player
onready var enemies := $Enemies

var enemy_list: Array = []

var move_pattern := [Vector2(0,-1), Vector2(1,0), Vector2(0,1), Vector2(-1,0)]

#onready var old_globalPosition : Vector2 = player.global_position

# "8x8 cell
var cell_size := 48


func _ready() -> void:
	initialize_enemies()
	
func initialize_enemies():
	enemy_list = enemies.get_children()
	for i in enemy_list.size():
		var enemy = enemy_list[i]
		enemy.position = enemy.spawn_point
		enemy.tracking_index = i
	
func _process(delta: float) -> void:
	pass
	#print(old_globalPosition / cell_size)
	
func _check_player_moved():
	pass
