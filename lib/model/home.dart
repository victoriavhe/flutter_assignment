import 'package:json_annotation/json_annotation.dart';

import 'item.dart';

part 'home.g.dart';

@JsonSerializable()
class Home {
  @JsonKey(name: "section")
  String section;

  @JsonKey(name: "section_title")
  String sectionTitle;

  @JsonKey(name: "items")
  List<Item> items;

  Home(this.section, this.sectionTitle, this.items);

  factory Home.fromJson(Map<String, dynamic> json) =>
      _$HomeFromJson(json);

  Map<String, dynamic> toJson() => _$HomeToJson(this);

}