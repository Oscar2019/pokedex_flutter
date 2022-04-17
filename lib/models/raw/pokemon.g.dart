// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ability _$AbilityFromJson(Map<String, dynamic> json) => Ability(
      effectEntries: (json['effect_entries'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : VerboseEffect.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$AbilityToJson(Ability instance) => <String, dynamic>{
      'effect_entries': instance.effectEntries,
      'id': instance.id,
      'name': instance.name,
    };

AbilityEffectChange _$AbilityEffectChangeFromJson(Map<String, dynamic> json) =>
    AbilityEffectChange(
      effectEntries: (json['effect_entries'] as List<dynamic>?)
          ?.map((e) => AbilityEffectChange.fromJson(e as Map<String, dynamic>))
          .toList(),
      versionGroup: json['version_group'] == null
          ? null
          : NamedAPIResource.fromJson(
              json['version_group'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AbilityEffectChangeToJson(
        AbilityEffectChange instance) =>
    <String, dynamic>{
      'effect_entries': instance.effectEntries,
      'version_group': instance.versionGroup,
    };

AbilityFlavorText _$AbilityFlavorTextFromJson(Map<String, dynamic> json) =>
    AbilityFlavorText(
      flavorText: json['flavor_text'] as String?,
      language: json['language'] == null
          ? null
          : NamedAPIResource.fromJson(json['language'] as Map<String, dynamic>),
      versionGroup: json['version_group'] == null
          ? null
          : NamedAPIResource.fromJson(
              json['version_group'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AbilityFlavorTextToJson(AbilityFlavorText instance) =>
    <String, dynamic>{
      'flavor_text': instance.flavorText,
      'language': instance.language,
      'version_group': instance.versionGroup,
    };

AbilityPokemon _$AbilityPokemonFromJson(Map<String, dynamic> json) =>
    AbilityPokemon(
      isHidden: json['is_hidden'] as bool?,
      slot: json['slot'] as int?,
      pokemon: json['pokemon'] == null
          ? null
          : NamedAPIResource.fromJson(json['pokemon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AbilityPokemonToJson(AbilityPokemon instance) =>
    <String, dynamic>{
      'is_hidden': instance.isHidden,
      'slot': instance.slot,
      'pokemon': instance.pokemon,
    };

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon(
      abilities: (json['abilities'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : PokemonAbility.fromJson(e as Map<String, dynamic>))
          .toList(),
      height: json['height'] as int?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      sprites: json['sprites'] == null
          ? null
          : PokemonSprites.fromJson(json['sprites'] as Map<String, dynamic>),
      stats: (json['stats'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : PokemonStat.fromJson(e as Map<String, dynamic>))
          .toList(),
      types: (json['types'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : PokemonType.fromJson(e as Map<String, dynamic>))
          .toList(),
      weight: json['weight'] as int?,
    );

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'abilities': instance.abilities,
      'height': instance.height,
      'id': instance.id,
      'name': instance.name,
      'sprites': instance.sprites,
      'stats': instance.stats,
      'types': instance.types,
      'weight': instance.weight,
    };

PokemonAbility _$PokemonAbilityFromJson(Map<String, dynamic> json) =>
    PokemonAbility(
      isHidden: json['is_hidden'] as bool?,
      slot: json['slot'] as int?,
      ability: json['ability'] == null
          ? null
          : NamedAPIResource.fromJson(json['ability'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonAbilityToJson(PokemonAbility instance) =>
    <String, dynamic>{
      'is_hidden': instance.isHidden,
      'slot': instance.slot,
      'ability': instance.ability,
    };

PokemonType _$PokemonTypeFromJson(Map<String, dynamic> json) => PokemonType(
      slot: json['slot'] as int?,
      type: json['type'] == null
          ? null
          : NamedAPIResource.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonTypeToJson(PokemonType instance) =>
    <String, dynamic>{
      'slot': instance.slot,
      'type': instance.type,
    };

PokemonFormType _$PokemonFormTypeFromJson(Map<String, dynamic> json) =>
    PokemonFormType(
      slot: json['slot'] as int?,
      type: json['type'] == null
          ? null
          : NamedAPIResource.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonFormTypeToJson(PokemonFormType instance) =>
    <String, dynamic>{
      'slot': instance.slot,
      'type': instance.type,
    };

PokemonTypePast _$PokemonTypePastFromJson(Map<String, dynamic> json) =>
    PokemonTypePast(
      generation: json['generation'] == null
          ? null
          : NamedAPIResource.fromJson(
              json['generation'] as Map<String, dynamic>),
      types: (json['types'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : PokemonType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonTypePastToJson(PokemonTypePast instance) =>
    <String, dynamic>{
      'generation': instance.generation,
      'types': instance.types,
    };

PokemonHeldItem _$PokemonHeldItemFromJson(Map<String, dynamic> json) =>
    PokemonHeldItem(
      item: json['item'] == null
          ? null
          : NamedAPIResource.fromJson(json['item'] as Map<String, dynamic>),
      versionDetails: (json['version_details'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : PokemonHeldItemVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonHeldItemToJson(PokemonHeldItem instance) =>
    <String, dynamic>{
      'item': instance.item,
      'version_details': instance.versionDetails,
    };

PokemonHeldItemVersion _$PokemonHeldItemVersionFromJson(
        Map<String, dynamic> json) =>
    PokemonHeldItemVersion(
      version: json['version'] == null
          ? null
          : NamedAPIResource.fromJson(json['version'] as Map<String, dynamic>),
      rarity: json['rarity'] as int?,
    );

Map<String, dynamic> _$PokemonHeldItemVersionToJson(
        PokemonHeldItemVersion instance) =>
    <String, dynamic>{
      'version': instance.version,
      'rarity': instance.rarity,
    };

PokemonMove _$PokemonMoveFromJson(Map<String, dynamic> json) => PokemonMove(
      move: json['move'] == null
          ? null
          : NamedAPIResource.fromJson(json['move'] as Map<String, dynamic>),
      versionGroupDetails: (json['version_group_details'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : PokemonMoveVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonMoveToJson(PokemonMove instance) =>
    <String, dynamic>{
      'move': instance.move,
      'version_group_details': instance.versionGroupDetails,
    };

PokemonMoveVersion _$PokemonMoveVersionFromJson(Map<String, dynamic> json) =>
    PokemonMoveVersion(
      moveLearnMethod: json['move_learn_method'] == null
          ? null
          : NamedAPIResource.fromJson(
              json['move_learn_method'] as Map<String, dynamic>),
      versionGroup: json['version_group'] == null
          ? null
          : NamedAPIResource.fromJson(
              json['version_group'] as Map<String, dynamic>),
      levelLearnedAt: json['level_learned_at'] as int?,
    );

Map<String, dynamic> _$PokemonMoveVersionToJson(PokemonMoveVersion instance) =>
    <String, dynamic>{
      'move_learn_method': instance.moveLearnMethod,
      'version_group': instance.versionGroup,
      'level_learned_at': instance.levelLearnedAt,
    };

PokemonStat _$PokemonStatFromJson(Map<String, dynamic> json) => PokemonStat(
      stat: json['stat'] == null
          ? null
          : NamedAPIResource.fromJson(json['stat'] as Map<String, dynamic>),
      effort: json['effort'] as int?,
      baseStat: json['base_stat'] as int?,
    );

Map<String, dynamic> _$PokemonStatToJson(PokemonStat instance) =>
    <String, dynamic>{
      'stat': instance.stat,
      'effort': instance.effort,
      'base_stat': instance.baseStat,
    };

_PokemonSpritesOtherDreamWorld _$PokemonSpritesOtherDreamWorldFromJson(
        Map<String, dynamic> json) =>
    _PokemonSpritesOtherDreamWorld(
      frontDefault: json['front_default'] as String?,
      frontFemale: json['front_female'] as String?,
    );

Map<String, dynamic> _$PokemonSpritesOtherDreamWorldToJson(
        _PokemonSpritesOtherDreamWorld instance) =>
    <String, dynamic>{
      'front_default': instance.frontDefault,
      'front_female': instance.frontFemale,
    };

_PokemonSpritesOtherHome _$PokemonSpritesOtherHomeFromJson(
        Map<String, dynamic> json) =>
    _PokemonSpritesOtherHome(
      frontDefault: json['front_default'] as String?,
      frontFemale: json['front_female'] as String?,
    );

Map<String, dynamic> _$PokemonSpritesOtherHomeToJson(
        _PokemonSpritesOtherHome instance) =>
    <String, dynamic>{
      'front_default': instance.frontDefault,
      'front_female': instance.frontFemale,
    };

_PokemonSpritesOtherOfficialArtwork
    _$PokemonSpritesOtherOfficialArtworkFromJson(Map<String, dynamic> json) =>
        _PokemonSpritesOtherOfficialArtwork(
          frontDefault: json['front_default'] as String?,
        );

Map<String, dynamic> _$PokemonSpritesOtherOfficialArtworkToJson(
        _PokemonSpritesOtherOfficialArtwork instance) =>
    <String, dynamic>{
      'front_default': instance.frontDefault,
    };

_PokemonSpritesOther _$PokemonSpritesOtherFromJson(Map<String, dynamic> json) =>
    _PokemonSpritesOther(
      officialArtwork: json['official-artwork'] == null
          ? null
          : _PokemonSpritesOtherOfficialArtwork.fromJson(
              json['official-artwork'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonSpritesOtherToJson(
        _PokemonSpritesOther instance) =>
    <String, dynamic>{
      'official-artwork': instance.officialArtwork,
    };

PokemonSprites _$PokemonSpritesFromJson(Map<String, dynamic> json) =>
    PokemonSprites(
      frontDefault: json['front_default'] as String?,
      other: json['other'] == null
          ? null
          : _PokemonSpritesOther.fromJson(
              json['other'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonSpritesToJson(PokemonSprites instance) =>
    <String, dynamic>{
      'front_default': instance.frontDefault,
      'other': instance.other,
    };
