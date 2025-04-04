extends Node3D

var list:Array = [
	{
		"id": '',
		"first": '',
		"second": ''
	},
	{
		"id": 'Vasya',
		"first": 'Буду ли я самым оригинальным персом, если расскажу тебе, какой сегодня праздник? Согласно гуглу, сегодня международный день культуры, а также день кочегара и день лысых мужчин',
		"second": "Ира, с твоим Днем Рождения! А также с международным днем искусства, культуры и с днем кочегара! Побольше прекрасного вокруг и поменьше запары!"
	},
	{
		"id": 'Kostya',
		"first": 'Блин я хочу придумать что бы у нас с полей была совместная фраза так что я к тебе приду лично',
		"second": 'И тут тож самое'
	},
	{
		"id": 'Polya',
		"first": 'см Костя Грязнов',
		"second": '-//-'
	},
]

func getLine(charId: String, lineKey: String) -> String:
	for dialog in list:
		if dialog.id == charId:
			if dialog.has(lineKey):
				return dialog[lineKey]
	return "..."
