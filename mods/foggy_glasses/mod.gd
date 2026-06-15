extends Mod

func _ready() -> void:
    SpellFramework.add_spell("foggy_glasses",1000.0,Globals.SPELL_CATEGORY.SUPPORT)
