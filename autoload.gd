extends Node

# Autoloads global variables before loading _ready functions
# We don't nodes a value here, we only infer its type
# We then give it a value in its realitive script (i.e. in Player.gd: Autoload.player = self)

# global variable, accessible anywhere else by Autoload.player
onready var player : KinematicBody2D
# Autoload.EventSignal
signal PlayerMovedSignal 

signal PlayerAttackSignal
