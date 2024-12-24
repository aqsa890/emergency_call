import 'package:flutter/material.dart';

void main() {
  runApp(const CallApp());
}

class CallApp extends StatelessWidget {
  const CallApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFE53935),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const CallScreen(),
    );
  }
}

class CallScreen extends StatelessWidget {
  const CallScreen({Key? key}) : super(key: key);

  Widget _buildRegionCard(String region, List<Map<String, String>> numbers) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ExpansionTile(
        title: Text(
          region,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xff54428E),
          ),
        ),
        children: numbers.map((number) => ListTile(
          leading: const Icon(Icons.local_hospital, color: Color(0xffD62839)),
          title: Text(number['service'] ?? ''),
          subtitle: Text(
            number['number'] ?? '',
            style: const TextStyle(
              color: Color(0xffD62839),
              fontWeight: FontWeight.bold,
            ),
          ),
        )).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar
            Container(
              padding: const EdgeInsets.all(16),
              color: const Color(0xff54428E),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.medical_services, color: Colors.white),
                  Text(
                    'Emergency Numbers',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 24),
                ],
              ),
            ),

            // Welcome Message
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xff54428E),
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Text(
                'Important emergency numbers across Pakistan',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),

            // Emergency Numbers List
            Expanded(
              child: ListView(
                children: [
                  _buildRegionCard('National Emergency Numbers', [
                    // {'service': 'Police Emergency', 'number': '15'},
                    {'service': 'Ambulance', 'number': '1122'},
                    // {'service': 'Fire Brigade', 'number': '16'},
                    {'service': 'Emergency Relief', 'number': '115'},
                  ]),
                  _buildRegionCard('Punjab', [
                    {'service': 'Punjab Emergency Service', 'number': '1122'},
                    {'service': 'Rescue One', 'number': '130'},
                    // {'service': 'Punjab Police', 'number': '15'},
                    {'service': 'Lahore General Hospital', 'number': '042-99264051-60'},
                  ]),
                  _buildRegionCard('Sindh', [
                    {'service': 'Karachi Emergency', 'number': '115'},
                    {'service': 'Edhi Ambulance Service', 'number': '115'},
                    // {'service': 'Sindh Police', 'number': '15'},
                    {'service': 'Jinnah Hospital Karachi', 'number': '021-99201300'},
                  ]),
                  _buildRegionCard('Khyber Pakhtunkhwa', [
                    {'service': 'KPK Emergency Service', 'number': '1122'},
                    {'service': 'Lady Reading Hospital', 'number': '091-9211430'},
                    // {'service': 'KPK Police', 'number': '15'},
                  ]),
                  _buildRegionCard('Balochistan', [
                    {'service': 'Balochistan Emergency', 'number': '115'},
                    {'service': 'Civil Hospital Quetta', 'number': '081-9201102'},
                    // {'service': 'Balochistan Police', 'number': '15'},
                  ]),
                  _buildRegionCard('Islamabad Capital', [
                    {'service': 'ICT Emergency', 'number': '1122'},
                    {'service': 'PIMS Hospital', 'number': '051-9261170'},
                    // {'service': 'Capital Police', 'number': '15'},
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}