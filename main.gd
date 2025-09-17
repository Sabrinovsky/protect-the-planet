extends Node2D

func _ready() -> void:
	pause()

func _on_hud_start_game() -> void:
	resume()
	
func pause():
	get_tree().paused = true
	
func resume():
	get_tree().paused = false

func _on_hud_pause_game() -> void:
	pause()

func _on_earth_earth_die() -> void:
	pause()
	$HUD.game_over()

func _on_player_game_over() -> void:
	pause()
	$HUD.game_over()
