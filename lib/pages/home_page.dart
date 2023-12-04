import 'package:epra/pages/employee_details.dart';
import 'package:epra/pages/epra_portal.dart';
import 'package:epra/pages/licence_status.dart';
import 'package:epra/pages/ppa_status.dart';
import 'package:epra/pages/pump_prices.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final String facebookURL =
      'https://www.facebook.com/EnergyAndPetroleumRegulatoryAuthorityKE';
  final String twitterURL = 'https://twitter.com/EPRA_Ke';
  final String instagramURL = 'https://www.instagram.com/epra_kenya';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0), // Set a custom height
        child: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          //title: Text('Centered Image in AppBar'),
          flexibleSpace: Center(
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Image.asset(
                  'lib/img/epralogo.png', // Replace with your image asset path
                  width: 300, // Set the width of the image
                  height: 300, // Set the height of the image
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: const Drawer(),
      body: Padding(
        padding: const EdgeInsets.all(
          40.0,
        ), // Add padding around the Column
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //Image.asset('lib/img/epralogo.png'),
              const SizedBox(
                height: 30,
              ),
              Card(
                color: const Color.fromARGB(255, 255, 255, 255),
                elevation: 4, // Add elevation for a card-like effect
                child: ListTile(
                  tileColor: Colors.lightBlueAccent,
                  leading: const Icon(Icons.local_gas_station_outlined),
                  title: const Text('CURRENT PUMP PRICES'),
                  //subtitle: Text('Subtitle 1'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PetroleumTownWidget()));
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Card(
                color: Colors.white,
                elevation: 4, // Add elevation for a card-like effect
                child: ListTile(
                  tileColor: Colors.lightBlueAccent,
                  leading: const Icon(Icons.badge_outlined),
                  title: const Text('VERIFY EPRA LICENCE'),
                  //subtitle: Text('Subtitle 1'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LicenceStatusWidget()));
                  },
                ),
              ),
              const SizedBox(height: 16.0), // Add spacing between ListTiles
              Card(
                color: Colors.white,
                elevation: 4,
                child: ListTile(
                  tileColor: Colors.lightBlueAccent,
                  leading: const Icon(Icons.person_2_outlined),
                  title: const Text('CONFIRM EPRA EMPLOYEE'),
                  //. subtitle: Text('Subtitle 2'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const EmployeeDetailsWidget()));
                  },
                ),
              ),
              const SizedBox(height: 16.0),
              Card(
                color: Colors.white,
                elevation: 4,
                child: ListTile(
                  tileColor: Colors.lightBlueAccent,
                  leading: const Icon(Icons.cases_outlined),
                  title: const Text('CHECK PPA STATUS'),
                  // subtitle: Text('Subtitle 3'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PPAStatusWidget()));
                  },
                ),
              ),
              const SizedBox(height: 16.0), // Add spacing between ListTiles
              Card(
                elevation: 4,
                child: ListTile(
                  tileColor: Colors.lightBlueAccent,
                  leading: const Icon(Icons.public_outlined),
                  title: const Text('EPRA PORTAL LOGIN'),
                  //. subtitle: Text('Subtitle 2'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EpraPortalWidget()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.grey[200], // Customize the background color as needed
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.facebook),
              onPressed: () {
                launchUrl(Uri.parse(facebookURL));
              },
            ),
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.xTwitter),
              onPressed: () {
                launchUrl(Uri.parse(twitterURL));
              },
            ),
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.instagram),
              onPressed: () {
                launchUrl(Uri.parse(instagramURL));
              },
            ),
            // Add more IconButton widgets for other social media platforms
          ],
        ),
      ),
    );
  }
}
