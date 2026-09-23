class_name AVFXMoveMonster extends AVFXResource

@export var offests_by_duration: Array [Vector2Float]

func _do(instance: AVFXInstance):
	Events.on_avfx_move.emit(instance, offests_by_duration)
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
