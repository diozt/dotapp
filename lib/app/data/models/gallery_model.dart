// To parse this JSON data, do
//
//     final galleryModel = galleryModelFromJson(jsonString);

import 'dart:convert';

GalleryModel galleryModelFromJson(String str) =>
    GalleryModel.fromJson(json.decode(str));

String galleryModelToJson(GalleryModel data) => json.encode(data.toJson());

class GalleryModel {
  GalleryModel({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  int statusCode;
  String message;
  List<Datum> data;

  factory GalleryModel.fromJson(Map<String, dynamic> json) => GalleryModel(
        statusCode: json["status_code"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.caption,
    required this.thumbnail,
    required this.image,
  });

  String caption;
  String thumbnail;
  String image;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        caption: json["caption"],
        thumbnail: json["thumbnail"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "caption": caption,
        "thumbnail": thumbnail,
        "image": image,
      };
}
