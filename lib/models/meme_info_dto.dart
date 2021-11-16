class MemeInfoDto {
  final String id;
  final String name;
  final String url;
  final int width;
  final int height;
  final int boxCount;

  const MemeInfoDto({
    required this.id,
    required this.name,
    required this.url,
    required this.width,
    required this.height,
    required this.boxCount,
  });

  factory MemeInfoDto.fromJson(Map<String, dynamic> json) {
    return MemeInfoDto(
      id: json['id'],
      name: json['name'],
      url: json['url'],
      width: json['width'],
      height: json['height'],
      boxCount: json['box_count'],
    );
  }
}
