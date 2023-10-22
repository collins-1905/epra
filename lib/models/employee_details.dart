class EmployeeDetails {
  final String name;
  final String jobTitle;
  final String department;

  EmployeeDetails({
    required this.name,
    required this.jobTitle,
    required this.department,
  });

  factory EmployeeDetails.fromJson(Map<String, dynamic> json) =>
      EmployeeDetails(
        name: json['message']['Name'],
        jobTitle: json['message']['JobTitle'],
        department: json['message']['Department'],
      );
}
