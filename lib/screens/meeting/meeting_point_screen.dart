import 'package:flutter/material.dart';

/// Screen for setting or viewing a campus meeting point for item handover.
class MeetingPointScreen extends StatefulWidget {
  const MeetingPointScreen({super.key});

  @override
  State<MeetingPointScreen> createState() => _MeetingPointScreenState();
}

class _MeetingPointScreenState extends State<MeetingPointScreen> {
  // IIT BHU Popular Campus Meeting Locations
  final List<Map<String, String>> _campusSpots = [
    {
      'name': 'Vishwanath Temple (VT)',
      'description': 'Near central temple courtyard & refreshment stalls',
    },
    {
      'name': 'Limbdi Corner (LC)',
      'description': 'Main junction near Limbdi Hostel & Canteen',
    },
    {
      'name': 'Student Activity Center (SAC)',
      'description': 'Near SAC sports ground & main hall entrance',
    },
    {
      'name': 'Main Library Lawn',
      'description': 'Opposite Sayaji Rao Gaekwad Library',
    },
    {
      'name': 'Technex / Gymkhana Ground',
      'description': 'Open ground area near Gymkhana building',
    },
    {
      'name': 'Hostel Common Room / Gate',
      'description': 'Specific buyer/seller hostel gate',
    },
  ];

  String? _selectedSpot = 'Limbdi Corner (LC)';
  DateTime _selectedDate = DateTime.now().add(const Duration(hours: 2));
  TimeOfDay _selectedTime = const TimeOfDay(hour: 17, minute: 30);

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 14)),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus Meeting Point'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header instruction
            const Text(
              'Select Meeting Location & Time',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              'Choose a safe public spot on IIT BHU campus to meet and inspect the item.',
              style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 20),

            // Map / Location Placeholder Container
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.deepPurple.shade200),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.map_outlined,
                    size: 48,
                    color: Colors.deepPurple,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Campus Map Selector Placeholder',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple.shade800,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Selected Spot: IIT BHU Campus',
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Location Selector Dropdown / Selection
            const Text(
              'Popular Campus Spots',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: _selectedSpot,
                    items: _campusSpots.map((spot) {
                      return DropdownMenuItem<String>(
                        value: spot['name'],
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              spot['name']!,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              spot['description']!,
                              style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        _selectedSpot = val;
                      });
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Date & Time Selectors
            const Text(
              'Schedule Meeting Time',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _pickDate,
                    icon: const Icon(Icons.calendar_today),
                    label: Text(
                      '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _pickTime,
                    icon: const Icon(Icons.access_time),
                    label: Text(_selectedTime.format(context)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),

            // Submit / Save Button
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                onPressed: () {
                  // TODO: Save meeting point proposal and send to chat / agreement screen
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Meeting proposed at $_selectedSpot'),
                    ),
                  );
                },
                icon: const Icon(Icons.check),
                label: const Text(
                  'Propose Meeting Location',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
