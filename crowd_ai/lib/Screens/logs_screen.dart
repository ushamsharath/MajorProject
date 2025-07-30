import 'package:flutter/material.dart';

class LogsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> logs;

  const LogsScreen({Key? key, required this.logs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crowd Count Logs'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemCount: logs.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final log = logs[index];
          return ListTile(
            leading: Icon(
              log['alert'] ? Icons.warning : Icons.check_circle,
              color: log['alert'] ? Colors.red : Colors.green,
            ),
            title: Text('Zone: ${log['zone']}'),
            subtitle: Text('Count: ${log['count']} / Limit: ${log['limit']}'),
            trailing: Text(log['timestamp']),
          );
        },
      ),
    );
  }
}
