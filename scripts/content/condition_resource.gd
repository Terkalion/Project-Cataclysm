class_name ConditionResource extends Resource

@export var name: String
@export var stat_modifier: Array[StatModifier]
@export var on_begin_turn_effects: Array[TargetedEffect]
@export var duration: int = 3
@export var status_condition: bool = false
@export var max_status_stacks: int = 1
@export var max_stats_stacks: int = 3
@export var short_name: String = "Default"
