import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
  @JsonKey(name: "article_title")
  String articleTitle;

  @JsonKey(name: "article_image")
  String articleImage;

  @JsonKey(name: "product_name")
  String productName;

  @JsonKey(name: "product_image")
  String productImage;

  @JsonKey(name: "link")
  String link;

  Item(this.articleTitle, this.articleImage, this.productName,
      this.productImage, this.link);

  factory Item.fromJson(Map<String, dynamic> json) =>
      _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}