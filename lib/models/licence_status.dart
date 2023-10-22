class LicenceStatus {
  final String contactCompanyName;
  final String licenceExpiryDate;
  final String licenceType;
  final String licenceClass;
  final String licenceStatus;

  LicenceStatus(
      {required this.contactCompanyName,
      required this.licenceExpiryDate,
      required this.licenceType,
      required this.licenceClass,
      required this.licenceStatus});

  factory LicenceStatus.fromJson(Map<String, dynamic> json) => LicenceStatus(
        contactCompanyName: json['message']["ContactCompanyName"],
        licenceExpiryDate: json['message']["LicenceExpiryDate"],
        licenceType: json['message']["LicenceType"],
        licenceClass: json['message']["LicenceClass"],
        licenceStatus: json['message']["LicenceStatus"],
      );
}
