

import 'package:json_annotation/json_annotation.dart';
import 'utility.dart';
part 'pokemon.g.dart';

@JsonSerializable()
class Pokemon {
  Pokemon({
      this.abilities,
      this.baseExperience,
      this.forms,
      this.gameIndices,
      this.height,
      this.heldItems,
      this.id,
      this.isDefault,
      this.locationAreaEncounters,
      this.moves,
      this.name,
      this.order,
      this.pastTypes,
      this.species,
      this.sprites,
      this.stats,
      this.types,
      this.weight});

  final List<PokemonAbility?>? abilities;
  @JsonKey(name: 'base_experience')
  final int? baseExperience;
  final List<NamedAPIResource?>? forms;
  @JsonKey(name: 'game_indices')
  final List<VersionGameIndex?>? gameIndices;
  final int? height;
  @JsonKey(name: 'held_items')
  final List<PokemonHeldItem?>? heldItems;
  final int? id;
  @JsonKey(name: 'is_default')
  final bool? isDefault;
  @JsonKey(name: 'location_area_encounters')
  final String? locationAreaEncounters;
  final List<PokemonMove?>? moves;
  final String? name;
  final int? order;
  @JsonKey(name: 'past_types')
  final List<PokemonTypePast?>? pastTypes;
  final NamedAPIResource? species;
  final PokemonSprites? sprites;
  final List<PokemonStat?>? stats;
  final List<PokemonType?>? types;
  final int? weight;

  factory Pokemon.fromJson(Map<String, dynamic> json) => _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}

@JsonSerializable()
class PokemonAbility{
  PokemonAbility({
    this.isHidden,
    this.slot,
    this.ability,
  });

  @JsonKey(name: 'is_hidden')
  final bool? isHidden;
  final int? slot;
  final NamedAPIResource? ability;

  factory PokemonAbility.fromJson(Map<String, dynamic> json) => _$PokemonAbilityFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonAbilityToJson(this);
}

@JsonSerializable()
class PokemonType{
  PokemonType({
    this.slot,
    this.type,
  });

  final int? slot;
  final NamedAPIResource? type;

  factory PokemonType.fromJson(Map<String, dynamic> json) => _$PokemonTypeFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonTypeToJson(this);
}

@JsonSerializable()
class PokemonFormType{
  PokemonFormType({
    this.slot,
    this.type,
  });

  final int? slot;
  final NamedAPIResource? type;

  factory PokemonFormType.fromJson(Map<String, dynamic> json) => _$PokemonFormTypeFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonFormTypeToJson(this);
}

@JsonSerializable()
class PokemonTypePast{
  PokemonTypePast({
    this.generation,
    this.types,
  });

  final NamedAPIResource? generation;
  final List<PokemonType?>? types;

  factory PokemonTypePast.fromJson(Map<String, dynamic> json) => _$PokemonTypePastFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonTypePastToJson(this);
}

@JsonSerializable()
class PokemonHeldItem{
  PokemonHeldItem({
    this.item,
    this.versionDetails,
  });

  final NamedAPIResource? item;
  @JsonKey(name: 'version_details')
  final List<PokemonHeldItemVersion?>? versionDetails;

  factory PokemonHeldItem.fromJson(Map<String, dynamic> json) => _$PokemonHeldItemFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonHeldItemToJson(this);
}

@JsonSerializable()
class PokemonHeldItemVersion{
  PokemonHeldItemVersion({
    this.version,
    this.rarity,
  });

  final NamedAPIResource? version;
  final int? rarity;

  factory PokemonHeldItemVersion.fromJson(Map<String, dynamic> json) => _$PokemonHeldItemVersionFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonHeldItemVersionToJson(this);
}

@JsonSerializable()
class PokemonMove{
  PokemonMove({
    this.move,
    this.versionGroupDetails,
  });

  final NamedAPIResource? move;
  @JsonKey(name: 'version_group_details')
  final List<PokemonMoveVersion?>? versionGroupDetails;

  factory PokemonMove.fromJson(Map<String, dynamic> json) => _$PokemonMoveFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonMoveToJson(this);
}

@JsonSerializable()
class PokemonMoveVersion{
  PokemonMoveVersion({
    this.moveLearnMethod,
    this.versionGroup,
    this.levelLearnedAt,
  });

  @JsonKey(name: 'move_learn_method')
  final NamedAPIResource? moveLearnMethod;
  @JsonKey(name: 'version_group')
  final NamedAPIResource? versionGroup;
  @JsonKey(name: 'level_learned_at')
  final int? levelLearnedAt;

  factory PokemonMoveVersion.fromJson(Map<String, dynamic> json) => _$PokemonMoveVersionFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonMoveVersionToJson(this);
}

@JsonSerializable()
class PokemonStat{
  PokemonStat({
    this.stat,
    this.effort,
    this.baseStat,
  });

  final NamedAPIResource? stat;
  final int? effort;
  @JsonKey(name: 'base_stat')
  final int? baseStat;

  factory PokemonStat.fromJson(Map<String, dynamic> json) => _$PokemonStatFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonStatToJson(this);
}

@JsonSerializable()
class PokemonSprites{
  PokemonSprites({
    this.frontDefault,
    this.frontShiny,
    this.frontFemale,
    this.frontShinyFemale,
    this.backDefault,
    this.backShiny,
    this.backFemale,
    this.backShinyFemale,
  });

  @JsonKey(name: 'front_default')
  final String? frontDefault;
  @JsonKey(name: 'front_shiny')
  final String? frontShiny;
  @JsonKey(name: 'front_female')
  final String? frontFemale;
  @JsonKey(name: 'front_shiny_female')
  final String? frontShinyFemale;
  @JsonKey(name: 'back_default')
  final String? backDefault;
  @JsonKey(name: 'back_shiny')
  final String? backShiny;
  @JsonKey(name: 'back_female')
  final String? backFemale;
  @JsonKey(name: 'back_shiny_female')
  final String? backShinyFemale;

  factory PokemonSprites.fromJson(Map<String, dynamic> json) => _$PokemonSpritesFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonSpritesToJson(this);
}