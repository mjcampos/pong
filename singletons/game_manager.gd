extends Node

enum GoalType {
	PLAYER,
	ENEMY
}

var ball_location: Vector2
var game_started: bool = false
var winner_determined: bool = false

func _ready():
	SignalManager.on_countdown_complete.connect(start_game)
	SignalManager.on_reset_position.connect(end_game)
	SignalManager.on_game_over.connect(end_game)
	SignalManager.on_game_over.connect(set_winner)

func set_ball_location(bl: Vector2):
	ball_location = bl

func get_ball_location():
	return ball_location

func start_game():
	game_started = true
	
func end_game():
	game_started = false

func get_game_started():
	return game_started

func set_winner():
	winner_determined = true

func reset_scene():
	ScoreManager.default_settings()
	get_tree().reload_current_scene()

func go_to_main():
	pass
