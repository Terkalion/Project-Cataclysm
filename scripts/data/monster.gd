class_name Monster

var species: SpeciesResources
var hp: int
var nickname: String
var moves: Array [Move] = []
var conditions: Array [Condition] = []
var fallback_move


var move_blocked: bool
var chosen_move


var image: Texture2D:
	get: return species.image
	
var name: String:
	get: return nickname if nickname else species.name

var type: MonsterType.Type:
	get: return species.type
	
var max_hp: int:
	get: return clamp(species.base_max_hp + sum_condition_stats_for_code(Stat.Code.MAX_HP), 1, 9999999999999)
	
var attack: int:
	get: return clamp(species.base_attack + sum_condition_stats_for_code(Stat.Code.ATK), 1, 9999999999999)

var defence: int:
	get: return clamp(species.base_defence + sum_condition_stats_for_code(Stat.Code.DEF), 1, 9999999999999)

#var special_attack: int:
#	get: return clamp(species.base_special_attack + sum_condition_stats_for_code(Stat.Code.SPATK), 1, 9999999999999)
	
#var special_defense: int:
#	get: return clamp(species.base_special_defense + sum_condition_stats_for_code(Stat.Code.SPDEF), 1, 9999999999999)

var speed: int:
	get: return clamp(species.base_speed + sum_condition_stats_for_code(Stat.Code.SPD), 1, 9999999999999)

func get_legal_move_indices() -> Array[int]:
	var legal_indices: Array[int] = []
	for i in range(0, moves.size()):
		if moves[i] and moves [i].usages > 0:
			legal_indices.append(i)
	return legal_indices

func sum_condition_stats_for_code(code: Stat.Code):
	var sum = 0
	for condition in conditions:
		for stat_modifier in condition.resource.stat_modifier:
			if stat_modifier.stat == code:
				sum += stat_modifier.modifier
	return sum

func get_condition_string():
	if conditions.size() == 0:
		return "Lv1"
	elif conditions[0].resource.short_name == "Default":
		return "Lv1"
	else:
		return conditions[0].resource.short_name

func dump_state():
	var condition_string = "\n"
	
	for condition in conditions:
		condition_string += "{name} - ({remaining})\n".format({"name": condition.name, "remaining": condition.duration_remaining})
	
	return "Name: {name}\nHP: ({hp}/{max_hp})\nATK: {attack}\nDEF: {defence}\nSPD: {speed}\nConditions: {conditions}"\
	.format({
		"name": name,
		"hp": hp,
		"max_hp": max_hp,
		"attack": attack,
		"defence": defence,
		#"special_attack": special_atack,
		#"special_defence": special_defence,
		"speed": speed,
		"conditions": condition_string,
	})
