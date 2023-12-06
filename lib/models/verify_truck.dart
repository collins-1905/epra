class VerifyTruck {
  final String licenceNumber;
  final String contactCompanyName;
  final String vehicleType;
  final String licenceExpiryDate;

  VerifyTruck({
    required this.licenceNumber,
    required this.contactCompanyName,
    required this.vehicleType,
    required this.licenceExpiryDate,
  });

  factory VerifyTruck.fromJson(Map<String, dynamic> json) {
    return VerifyTruck(
      licenceNumber: json['message']['LicenceNumber'],
      contactCompanyName: json['message']['ContactCompanyName'],
      vehicleType: json['message']['VehicleType'],
      licenceExpiryDate: json['message']['LicenceExpiryDate'],
    );
  }
}
