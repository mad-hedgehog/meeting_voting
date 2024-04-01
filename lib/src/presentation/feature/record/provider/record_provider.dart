import 'package:meeting_voting/src/presentation/common/provider.dart';
import 'package:meeting_voting/src/presentation/model/successful_record.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'record_provider.g.dart';

@riverpod
Future<List<SuccessfulRecord>> successfulRecord(SuccessfulRecordRef ref) async {
  final pb = ref.read(pocketBaseProvider);
  final records = await pb.collection('log').getFullList(
        expand: 'participants, todo',
      );

  final logs = records.map((record) {
    final name = record.expand['participants']?.first.data['name'];
    final todos = List<String>.from(record.expand['todo']?.map((r) => r.data['title']) ?? []);
    final dateTime = DateTime.parse(record.data['datetime']);

    return SuccessfulRecord(name, todos, dateTime);
  }).toList();

  return logs;
}
