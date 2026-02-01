extends Node

var HasMask: bool = false
var MinigamesCompleted: int = 0
var PreviousGoal: int = 0
var CurrentGoal: int = 1


func _randomise_goal():
	PreviousGoal = CurrentGoal
	CurrentGoal = randi_range(1,4)
	if CurrentGoal == PreviousGoal:
		CurrentGoal = randi_range(1,4)
