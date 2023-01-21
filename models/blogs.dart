import 'package:json_annotation/json_annotation.dart';
part 'blogs.g.dart';

@JsonSerializable()
class ApiBlogs {
  ApiBlogs();
   int? id;
   String? title;
   String? title_in_chinese;
   String? author_name;
   String? posted_date;
   String? description;
   String? description_in_chinese;
   String? image;
   String? createdAt;
   String? updatedAt;

  // ApiBlogs(
  //   this.id,
  //   this.title,
  //   this.title_in_chinese,
  //   this.author_name,
  //   this.posted_date,
  //   this.description,
  //   this.description_in_chinese,
  //   this.image,
  //   this.createdAt,
  //   this.updatedAt,
  // );
  factory ApiBlogs.fromJson(Map<String, dynamic> json) =>
      _$ApiBlogsFromJson(json);
  Map<String, dynamic> toJson() => _$ApiBlogsToJson(this);
}
