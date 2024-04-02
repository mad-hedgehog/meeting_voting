import 'package:meeting_voting/src/presentation/common/provider.dart';
import 'package:meeting_voting/src/presentation/model/successful_record.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'record_provider.g.dart';

@riverpod
class RecordPageNumber extends _$RecordPageNumber {
  @override
  int build() => 1;

  void set(int value) => state = value;
}

@riverpod
Future<int> totalRecordPageNumber(TotalRecordPageNumberRef ref) async {
  final records = await ref.read(recordsProvider.future);

  return records.totalPages;
}

@riverpod
Future<ResultList<RecordModel>> records(RecordsRef ref) async {
  final pb = ref.read(pocketBaseProvider);
  final page = ref.watch(recordPageNumberProvider);

  final records = await pb.collection('log').getList(
        page: page,
        perPage: 10,
        sort: '-datetime,created',
        expand: 'participants, todo',
      );

  return records;
}

@riverpod
Future<List<SuccessfulRecord>> successfulRecord(SuccessfulRecordRef ref) async {
  final records = await ref.watch(recordsProvider.future);

  final logs = records.items.map((record) {
    final name = record.expand['participants']?.first.data['name'] ?? record.data['participants'];
    final todos = List<String>.from(record.expand['todo']?.map((r) => r.data['title']) ?? []);
    final dateTime = DateTime.parse(record.data['datetime']);

    return SuccessfulRecord(name, todos, dateTime);
  }).toList();

  return logs;
}
