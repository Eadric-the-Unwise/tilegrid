extends "res://Enemy.gd"

func _on_Player_Moved():
	position += move_pattern[index % 4] * unit_size
	index += 1
	print("Bat Index: " + str(index % 4))
