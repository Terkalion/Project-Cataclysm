class_name Calculations

static func get_crit_chance(monster: Monster) -> float:
	return clamp(monster.speed/ 100.0, 01, 0.5)

#effettuare un confronto con la speed del bersaglio,
#più si è lenti rispetto al nostro avversario più deve esssere semplice
#effettuare un crit 
