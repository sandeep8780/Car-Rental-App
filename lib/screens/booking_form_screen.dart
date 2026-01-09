import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/car.dart';
import '../models/booking.dart';
import '../providers/booking_provider.dart';
import 'booking_confirmation_screen.dart';

class BookingFormScreen extends StatelessWidget {
  final Car car;
  final String userName;

  BookingFormScreen({
    super.key,
    required this.car,
    required this.userName,
  });

  final startController = TextEditingController();
  final endController = TextEditingController();
  final locationController = TextEditingController();

  /// Date Picker Function
  Future<void> _selectDate(
    BuildContext context,
    TextEditingController controller,
  ) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      controller.text =
          "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text('Booking Details'),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Car Summary Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Icon(Icons.directions_car,
                        size: 40, color: Colors.blue),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          car.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${car.type} • ₹${car.pricePerDay.toInt()}/day',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            /// Booking Form Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    /// Start Date Picker
                    _dateField(
                      context: context,
                      controller: startController,
                      label: 'Start Date',
                      icon: Icons.calendar_today,
                    ),
                    const SizedBox(height: 16),

                    /// End Date Picker
                    _dateField(
                      context: context,
                      controller: endController,
                      label: 'End Date',
                      icon: Icons.calendar_today_outlined,
                    ),
                    const SizedBox(height: 16),

                    /// Location
                    _inputField(
                      controller: locationController,
                      label: 'Pickup Location',
                      icon: Icons.location_on,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            /// Confirm Button
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  context.read<BookingProvider>().setBooking(
                        Booking(
                          userName: userName,
                          car: car,
                          startDate: startController.text,
                          endDate: endController.text,
                          location: locationController.text,
                        ),
                      );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const BookingConfirmationScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Confirm Booking',
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

  /// Date Picker Field
  Widget _dateField({
    required BuildContext context,
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      readOnly: true,
      onTap: () => _selectDate(context, controller),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        suffixIcon: const Icon(Icons.arrow_drop_down),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  /// Normal Input Field
  Widget _inputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
