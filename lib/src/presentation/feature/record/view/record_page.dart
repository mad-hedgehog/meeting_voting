import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meeting_voting/src/presentation/model/successful_record.dart';
import 'package:pocketbase/pocketbase.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({super.key});

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  final List<SuccessfulRecord> _logs = [];
  final pb = PocketBase('https://personal-pocketbase.5rj6sc.easypanel.host');

  @override
  void initState() {
    super.initState();

    _fetch();
  }

  void _fetch() async {
    final records = await pb.collection('log').getFullList(
          expand: 'participants, todo',
        );

    final logs = records.map((record) {
      final name = record.expand['participants']?.first.data['name'];
      final todos = List<String>.from(record.expand['todo']?.map((r) => r.data['title']) ?? []);
      final dateTime = DateTime.parse(record.data['datetime']);

      return SuccessfulRecord(name, todos, dateTime);
    }).toList();

    setState(() {
      _logs.clear();
      _logs.addAll(logs);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: _fetch,
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _logs.length,
                itemBuilder: (context, index) {
                  final log = _logs[index];

                  return ListTile(
                    title: Text(log.name),
                    subtitle: Text(log.todos.join(', ')),
                    trailing: Text(DateFormat('MMM dd, yyyy').format(log.dateTime)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
