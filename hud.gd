extends CanvasLayer
signal start_game
signal pause_game

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	
func _on_start_game_pressed() -> void:
	start()

func _process(float) -> void:
	if Input.is_action_pressed("pause"):
		pause()
		
func start():
	$StartGame.hide()
	start_game.emit()

func pause():
	$StartGame.show()
	pause_game.emit()

func game_over():
	$Restart.show()
	$GameOverLabel.show()

func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()
