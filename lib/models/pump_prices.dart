class PetroleumPrice {
  final String townName;
  final String productText;
  final String pumpPrice;

  PetroleumPrice({
    required this.townName,
    required this.productText,
    required this.pumpPrice,
  });

  factory PetroleumPrice.fromJson(Map<String, dynamic> json) {
    return PetroleumPrice(
      townName: json['PetroleumTownName'],
      productText: json['DisplayText'],
      pumpPrice: json['PumpPrice'],
    );
  }
}
