import 'package:json_annotation/json_annotation.dart';
part 'utility.g.dart';

@JsonSerializable()
class APIResource {
  APIResource({this.url});

  final String? url;

  static RegExp idRegex = RegExp(r"\/(\d+)\/$");

  factory APIResource.fromJson(Map<String, dynamic> json) => _$APIResourceFromJson(json);

  Map<String, dynamic> toJson() => _$APIResourceToJson(this);

  String? get id {
    if(url != null){
      RegExpMatch? idMatch = idRegex.firstMatch(url!);
      if(idMatch != null){
        return idMatch.group(1);
      }
    }
    return null;
  }
}

@JsonSerializable()
class Description{
  Description({
    this.description,
    this.language
  });

  final String? description;
  final NamedAPIResource? language;

  factory Description.fromJson(Map<String, dynamic> json) => _$DescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$DescriptionToJson(this);
}

@JsonSerializable()
class Effect{
  Effect({
    this.effect,
    this.language
  });

  final String? effect;
  final NamedAPIResource? language;

  factory Effect.fromJson(Map<String, dynamic> json) => _$EffectFromJson(json);

  Map<String, dynamic> toJson() => _$EffectToJson(this);
}

@JsonSerializable()
class Encounter{
  Encounter({
    this.minLevel,
    this.maxLevel,
    this.conditionValues,
    this.chance,
    this.method
  });

  @JsonKey(name: 'min_level')
  final int? minLevel;
  @JsonKey(name: 'max_level')
  final int? maxLevel;
  @JsonKey(name: 'condition_values')
  final List<NamedAPIResource?>? conditionValues;
  final int? chance;
  final NamedAPIResource? method;

  factory Encounter.fromJson(Map<String, dynamic> json) => _$EncounterFromJson(json);

  Map<String, dynamic> toJson() => _$EncounterToJson(this);
}

@JsonSerializable()
class FlavorText{
  FlavorText({
    this.flavorText,
    this.language,
    this.version,
  });

  @JsonKey(name: 'flavor_text')
  final String? flavorText;
  final NamedAPIResource? language;
  final NamedAPIResource? version;

  factory FlavorText.fromJson(Map<String, dynamic> json) => _$FlavorTextFromJson(json);

  Map<String, dynamic> toJson() => _$FlavorTextToJson(this);
}

@JsonSerializable()
class GenerationGameIndex{
  GenerationGameIndex({
    this.gameIndex,
    this.generation
  });

  @JsonKey(name: 'game_index')
  final int? gameIndex;
  final NamedAPIResource? generation;

  factory GenerationGameIndex.fromJson(Map<String, dynamic> json) => _$GenerationGameIndexFromJson(json);

  Map<String, dynamic> toJson() => _$GenerationGameIndexToJson(this);
}

@JsonSerializable()
class MachineVersionDetail{
  MachineVersionDetail({
    this.machine,
    this.versionGroup
  });

  final APIResource? machine;
  @JsonKey(name: 'version_group')
  final NamedAPIResource? versionGroup;

  factory MachineVersionDetail.fromJson(Map<String, dynamic> json) => _$MachineVersionDetailFromJson(json);

  Map<String, dynamic> toJson() => _$MachineVersionDetailToJson(this);
}

@JsonSerializable()
class Name{
  Name({
    this.name,
    this.language
  });

  final String? name;
  final NamedAPIResource? language;

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);

  Map<String, dynamic> toJson() => _$NameToJson(this);
}

@JsonSerializable()
class  NamedAPIResource{
  NamedAPIResource({this.name, this.url});

  final String? name;
  final String? url;

  static RegExp idRegex = RegExp(r"\/(\d+)\/$");

  factory NamedAPIResource.fromJson(Map<String, dynamic> json) => _$NamedAPIResourceFromJson(json);

  Map<String, dynamic> toJson() => _$NamedAPIResourceToJson(this);

  String? get id {
    if(url != null){
      RegExpMatch? idMatch = idRegex.firstMatch(url!);
      if(idMatch != null){
        return idMatch.group(1);
      }
    }
    return null;
  }
}

@JsonSerializable()
class VerboseEffect{
  VerboseEffect({
    this.effect,
    this.shortEffect,
    this.language,
  });

  final String? effect;
  @JsonKey(name: 'short_effect')
  final String? shortEffect;
  final NamedAPIResource? language;

  factory VerboseEffect.fromJson(Map<String, dynamic> json) => _$VerboseEffectFromJson(json);

  Map<String, dynamic> toJson() => _$VerboseEffectToJson(this);
}

@JsonSerializable()
class VersionEncounterDetail{
  VersionEncounterDetail({
    this.version,
    this.maxChance,
    this.encounterDetails,
  });

  final NamedAPIResource? version;
  @JsonKey(name: 'max_chance')
  final int? maxChance;
  @JsonKey(name: 'encounter_details')
  final List<Encounter>? encounterDetails;

  factory VersionEncounterDetail.fromJson(Map<String, dynamic> json) => _$VersionEncounterDetailFromJson(json);

  Map<String, dynamic> toJson() => _$VersionEncounterDetailToJson(this);
}

@JsonSerializable()
class VersionGameIndex{
  VersionGameIndex({
    this.gameIndex,
    this.version,
  });

  @JsonKey(name: 'game_index')
  final int? gameIndex;
  final NamedAPIResource? version;

  factory VersionGameIndex.fromJson(Map<String, dynamic> json) => _$VersionGameIndexFromJson(json);

  Map<String, dynamic> toJson() => _$VersionGameIndexToJson(this);
}

@JsonSerializable()
class VersionGroupFlavorText{
  VersionGroupFlavorText({
    this.text,
    this.language,
    this.versionGroup,
  });

  final String? text;
  final NamedAPIResource? language;
  @JsonKey(name: 'version_group')
  final NamedAPIResource? versionGroup;

  factory VersionGroupFlavorText.fromJson(Map<String, dynamic> json) => _$VersionGroupFlavorTextFromJson(json);

  Map<String, dynamic> toJson() => _$VersionGroupFlavorTextToJson(this);
}

@JsonSerializable()
class NamedAPIResourceList{
  NamedAPIResourceList({
    this.count,
    this.next,
    this.previous,
    this.result,
  });

  final int? count;
  final String? next;
  final String? previous;
  final NamedAPIResource? result;

  factory NamedAPIResourceList.fromJson(Map<String, dynamic> json) => _$NamedAPIResourceListFromJson(json);

  Map<String, dynamic> toJson() => _$NamedAPIResourceListToJson(this);
}

