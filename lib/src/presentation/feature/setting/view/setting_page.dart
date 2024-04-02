import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meeting_voting/src/presentation/common/provider.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(recordModelProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Center(
              child: CircleAvatar(
                radius: 56,
                // backgroundImage: NetworkImage(model.data['avatar']),
              ),
            ),
            Text('${model.data['username']}', style: const TextStyle(fontWeight: FontWeight.bold)),
            Text('${model.data['name']}', style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
