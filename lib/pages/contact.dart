import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContactUsPage(),
    );
  }
}

class ContactUsPage extends StatelessWidget {
  final List<Map<String, dynamic>> offices = [
    {
      'name': 'Head Office',
      'address':
          'Eagle Africa Centre, Longonot Road, Upperhill\nP.O Box 42681-00100, Nairobi',
      'tel': '+254 709 336 000 | +254 020 284 7000',
      'email': 'info@epra.go.ke'
    },
    {
      'name': 'South Rift Region - Nakuru',
      'address':
          'Jennifer Riria Hub, Kipchoge Road, Opposite Bontana Hotel Nakuru,\nP.O Box 785 – 20100, NAKURU.',
      'tel': '+254 709 336 601 / +254 020 284 7601',
      'email': 'info@epra.go.ke'
    },
    {
      'name': 'Nyanza & Western Region - Kisumu',
      'address': 'Lake Basin Mall, 2nd Floor\nP.O Box 7540-40100, KISUMU.',
      'tel': '+254 709 336 601 / +254 020 284 7601',
      'email': 'info@epra.go.ke'
    },
    {
      'name': 'North Rift Region – Lodwar',
      'address':
          'Former WFP Office, Along Lodwar Airport Road,\nP.O Box 447 – 30500, LODWAR.',
      'tel': '020 7859356',
      'email': 'info@epra.go.ke'
    },
    {
      'name': 'North Rift Region - Eldoret',
      'address':
          'Off Eldoret – Malaba Road, Eldoret Daima Towers, 7th Floor.\nP.O Box 6950-30100, ELDORET.',
      'tel': '020 7859465',
      'email': 'info@epra.go.ke'
    },
    {
      'name': 'Coast Region - Mombasa',
      'address':
          'Moi Avenue, Kilindini Plaza Building, 3rd floor.\nP.O Box 83315-80100, MOMBASA.',
      'tel': '066 2322946',
      'email': 'info@epra.go.ke'
    },
    {
      'name': 'Central Region - Nyeri',
      'address':
          'KDS Centre, 4th Floor, Kimathi Way.\nP.O Box 1670-10100, NYERI.',
      'tel': '066 2321859',
      'email': 'info@epra.go.ke'
    },
    {
      'name': 'North Eastern Region – Isiolo',
      'address':
          'BarsalingaTowers, 2nd Floor Along Isiolo Moyale Road.\nP.O Box 55 – 60300, ISIOLO.',
      'tel': '020 7859356',
      'email': 'info@epra.go.ke'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      body: ListView.builder(
        itemCount: offices.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(offices[index]['name']),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(offices[index]['address']),
                SizedBox(height: 4),
                Text('Tel: ${offices[index]['tel']}'),
                Text('Email: ${offices[index]['email']}'),
              ],
            ),
            onTap: () {
              // Implement action when a contact is tapped
              // For example, open email or dial phone number
              // You can use packages like url_launcher for this purpose
            },
          );
        },
      ),
    );
  }
}
