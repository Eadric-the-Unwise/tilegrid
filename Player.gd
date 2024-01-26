# Player Script
extends KinematicBody2D

onready var move_timer := $MoveTimer
onready var attack_timer := $AttackTimer

onready var area := $Area2D

# "8x8 cell
var cell_size := 48
# "16x16" unit
var unit_size := 96
var spawn_point := Vector2(8.0, 12.0)
var in_combat : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Note: You cannot set this value with time_left(). To change the timer's remaining time, use start().
	# Set move timer to 0.0
	move_timer.start(0.0)
	# Set player starting position
	position = spawn_point * cell_size
	# load player Node into Autoload global get_node
	Autoload.player = self
	area.connect("body_entered", self, "_on_Area2D_body_entered")
	
func _process(_delta: float) -> void:
	if move_timer.time_left == 0.0:
		_move_player()	
	if in_combat && attack_timer.time_left == 0.0:
		render_combat()
		
		
func _on_Area2D_body_entered(body: Node):
	in_combat = true
	if in_combat:
		print("ENTERED COMBAT!")
		#print("Enemy" + str(body.tracking_index))
				

func render_combat():
		if Input.is_action_pressed("select"):
			print("Attack!")
			attack_timer.start()
			Autoload.emit_signal("PlayerAttackSignal", 5)
	
func _move_player():
	
	var direction := Vector2.ZERO
	direction.x = Input.get_axis("move_left", "move_right")
	direction.y = Input.get_axis("move_up", "move_down")
	
	# wait for input
	if !in_combat:
		if direction != Vector2(0.0, 0.0):
			Autoload.emit_signal("PlayerMovedSignal")
			position += direction * unit_size
			move_timer.start()
			print(position / cell_size)
	
	
