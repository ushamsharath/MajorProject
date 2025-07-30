import 'package:flutter/material.dart';
import '../../navigation.dart';

class ZoneSelectionScreen extends StatefulWidget {
  const ZoneSelectionScreen({Key? key}) : super(key: key);

  @override
  State<ZoneSelectionScreen> createState() => _ZoneSelectionScreenState();
}

class _ZoneSelectionScreenState extends State<ZoneSelectionScreen> {
  final TextEditingController _zoneController = TextEditingController();
  final TextEditingController _slotLimitController = TextEditingController();
  String? _selectedZone;
  int? _slotLimit;

  void _saveZone() {
    setState(() {
      _selectedZone = _zoneController.text;
      _slotLimit = int.tryParse(_slotLimitController.text);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Zone and slot limit saved!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Zone & Slot Limit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _zoneController,
              decoration: const InputDecoration(
                labelText: 'Zone Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _slotLimitController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Slot Limit',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveZone,
              child: const Text('Save'),
            ),
            if (_selectedZone != null && _slotLimit != null) ...[
              const SizedBox(height: 30),
              Text('Zone: $_selectedZone'),
              Text('Slot Limit: $_slotLimit'),
            ]
          ],
        ),
      ),
    );
  }
}
