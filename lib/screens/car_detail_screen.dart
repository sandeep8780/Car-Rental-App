import 'package:flutter/material.dart';
import '../models/car.dart';
import 'booking_form_screen.dart';

class CarDetailScreen extends StatelessWidget {
  final Car car;
  final String userName;

  const CarDetailScreen({
    super.key,
    required this.car,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: Text(car.name),
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF2196F3), Color(0xFF64B5F6)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Car Name
            Text(
              car.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),

            /// Car Type
            Text(
              car.type,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 20),

            /// Info Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    _infoRow(
                      icon: Icons.currency_rupee,
                      label: 'Price per Day',
                      value: '₹${car.pricePerDay.toInt()}',
                    ),
                    const Divider(),
                    _infoRow(
                      icon: Icons.category,
                      label: 'Car Type',
                      value: car.type,
                    ),
                    const Divider(),
                    _infoRow(
                      icon: Icons.event_available,
                      label: 'Availability',
                      value: car.available ? 'Available' : 'Not Available',
                      valueColor:
                          car.available ? Colors.green : Colors.red,
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),

            /// Book Button
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      car.available ? Colors.blue : Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: car.available
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BookingFormScreen(
                              car: car,
                              userName: userName,
                            ),
                          ),
                        );
                      }
                    : null,
                child: const Text(
                  'Book Now',
                  style: TextStyle(fontSize: 16,
                  color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow({
    required IconData icon,
    required String label,
    required String value,
    Color valueColor = Colors.black,
  }) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(width: 12),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: valueColor,
          ),
        ),
      ],
    );
  }
}
