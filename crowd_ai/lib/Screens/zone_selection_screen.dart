import 'package:flutter/material.dart';
import '../../navigation.dart';

class ZoneSelectionScreen extends StatefulWidget {
  const ZoneSelectionScreen({Key? key}) : super(key: key);

  @override
  State<ZoneSelectionScreen> createState() => _ZoneSelectionScreenState();
}

class _ZoneSelectionScreenState extends State<ZoneSelectionScreen> {
  final TextEditingController _zoneController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  String? _selectedZone;
  double? _areaSize;
  int? _availableSlots;
  int? _peoplePerSlot;

  void _saveZone() {
    setState(() {
      _selectedZone = _zoneController.text;
      _areaSize = double.tryParse(_areaController.text);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Zone and area saved!')),
    );
  }

  void _calculateSlots() {
    if (_areaController.text.isNotEmpty) {
      setState(() {
        _areaSize = double.tryParse(_areaController.text);
        if (_areaSize != null) {
          // Calculate slots based on 25 square meters per slot
          _availableSlots = (_areaSize! / 25).floor();
          // Calculate people proportional to area (4 people per square meter)
          _peoplePerSlot = _availableSlots! > 0 ? (_areaSize! * 4 / _availableSlots!).round() : 0;
        } else {
          _availableSlots = null;
          _peoplePerSlot = null;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A2239),
      appBar: AppBar(
        backgroundColor: const Color(0xFF117864),
        title: const Text(
          'Select Zone & Area',
          style: TextStyle(color: Color(0xFFF6F7EB)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _zoneController,
              style: const TextStyle(color: Color(0xFFF6F7EB)),
              decoration: const InputDecoration(
                labelText: 'Zone Name',
                labelStyle: TextStyle(color: Color(0xFFF6F7EB)),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF117864)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF117864)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF117864), width: 2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _areaController,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Color(0xFFF6F7EB)),
              decoration: const InputDecoration(
                labelText: 'Area Size (sq meters)',
                labelStyle: TextStyle(color: Color(0xFFF6F7EB)),
                hintText: 'Enter area in square meters',
                hintStyle: TextStyle(color: Color(0xFFB0B0B0)),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF117864)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF117864)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF117864), width: 2),
                ),
              ),
              onChanged: (value) => _calculateSlots(),
            ),
            const SizedBox(height: 20),
            if (_availableSlots != null && _peoplePerSlot != null) ...[
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF117864).withOpacity(0.2),
                  border: Border.all(color: const Color(0xFF117864)),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Area Calculation Results:',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFF6F7EB),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Available Slots: $_availableSlots',
                      style: const TextStyle(color: Color(0xFFF6F7EB)),
                    ),
                    Text(
                      'Area per Slot: ${_availableSlots! > 0 ? (_areaSize! / _availableSlots!).toStringAsFixed(2) : 0} sq meters',
                      style: const TextStyle(color: Color(0xFFF6F7EB)),
                    ),
                    Text(
                      'People per Slot: $_peoplePerSlot',
                      style: const TextStyle(color: Color(0xFFF6F7EB)),
                    ),
                    Text(
                      'Total Capacity: ${_availableSlots! * _peoplePerSlot!} people',
                      style: const TextStyle(color: Color(0xFFF6F7EB)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF117864),
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: _saveZone,
              child: const Text(
                'Save',
                style: TextStyle(fontSize: 18, color: Color(0xFFF6F7EB)),
              ),
            ),
            if (_selectedZone != null) ...[
              const SizedBox(height: 30),
              Text(
                'Zone: $_selectedZone',
                style: const TextStyle(color: Color(0xFFF6F7EB)),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
