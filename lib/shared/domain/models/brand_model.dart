class Brand {
  final String brandId;
  final String brandName;
  final String logoUrl;

  Brand({
    required this.brandId,
    required this.brandName,
    required this.logoUrl,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      brandId: json['id'],
      brandName: json['brandName'],
      logoUrl: json['logoUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'brandId': brandId,
      'brandName': brandName,
      'logoUrl': logoUrl,
    };
  }
}