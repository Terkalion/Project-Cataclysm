class_name MonsterType

enum Type{
	NORMAL,
	PURE,
	WATER,
	FIRE,
	PLANT
}

enum Effectiveness {
	NEUTRAL,
	WEAK,
	STRONG
}

const DAMAGE_MODIFIER_BY_EFFECT: Dictionary[Effectiveness, float] = {
	Effectiveness.NEUTRAL: 1.0,
	Effectiveness.WEAK: 0.5,
	Effectiveness.STRONG: 2.0
}

#move type on monster type

const EFFECTIVNESS_BY_TYPE: Dictionary[Type, Dictionary] ={
	Type.NORMAL: {},
	Type.FIRE: {
		Type.PLANT: Effectiveness.STRONG,
		Type.WATER: Effectiveness.WEAK
	},
	Type.PLANT: {
		Type.WATER: Effectiveness.STRONG,
		Type.FIRE: Effectiveness.WEAK
	},
	Type.WATER: {
		Type.FIRE: Effectiveness.STRONG,
		Type.PLANT: Effectiveness.WEAK
	}
}

static func get_type_effectiveness(source_type: Type, target_type: Type):
	if !EFFECTIVNESS_BY_TYPE.has(source_type) or !EFFECTIVNESS_BY_TYPE[source_type].has(target_type):
		return Effectiveness.NEUTRAL
	return EFFECTIVNESS_BY_TYPE[source_type][target_type]


static func get_type_advantage_coefficient(source_type: Type,target_type: Type):
	var effectiveness = get_type_effectiveness(source_type, target_type)
	return DAMAGE_MODIFIER_BY_EFFECT[effectiveness]
	
	
	
	
