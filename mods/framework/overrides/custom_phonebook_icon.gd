extends PhonebookIcon

var enemy_loader=load("res://mods/framework/enemy_loader.gd")

func set_entry(entry: PhonebookEntry) -> void :
	var entry_index: = entries.find(entry)
	if entry_index != -1 and SaveManager.has_valid_selected_save():
		var save: = SaveManager.get_save()
		save.data.selected_phonebook_entries[entries[0].id] = entry_index

	active_entry = entry

	sprite.texture=load(enemy_loader.custom_phonebook_icons[entry.id])
	
	if entry.is_locked():
		sprite.modulate = Color.BLACK
	else:
		sprite.modulate = Color.WHITE

	notification_icon.visible = false
	if SaveManager.has_valid_selected_save():
		for other_entry in entries:
			if not other_entry.is_locked() and not SaveManager.get_save().has_enemy_been_read(other_entry.id):
				notification_icon.visible = true
				break
