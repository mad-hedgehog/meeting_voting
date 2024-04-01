import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:meeting_voting/src/presentation/feature/record/provider/record_provider.dart';

class RecordPage extends StatelessWidget {
  const RecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 32),
            Expanded(
              child: Consumer(
                builder: (context, ref, child) {
                  final records = ref.watch(successfulRecordProvider);

                  return switch (records) {
                    AsyncData(:final value) => ListView.separated(
                        itemCount: value.length,
                        itemBuilder: (context, index) {
                          final log = value[index];

                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(log.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                                  Text(DateFormat('MMM dd, yyyy').format(log.dateTime)),
                                ],
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Wrap(
                                  spacing: 4,
                                  runSpacing: 4,
                                  children: log.todos.map((todo) {
                                    return Chip(
                                      label: Text(todo),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider(height: 32);
                        },
                      ),
                    _ => const Center(child: CircularProgressIndicator()),
                  };
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
