extends "res://Enemy.gd"

#spawn_point is in the Inspector

func _on_Player_Moved():
	position += move_pattern[index % 4] * unit_size
	index += 1
	#print("Bat Index: " + str(index % 4))
func _on_Area2D_body_entered(_body: Node2D):
	print("Enemy " + str(tracking_index) + "_BODY ENTERED AREA2D")
