import 'package:meeting_voting/src/presentation/common/provider.dart';
import 'package:meeting_voting/src/presentation/model/todo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'vote_provider.g.dart';

@riverpod
Future<List<Todo>> todos(TodosRef ref) async {
  final pb = ref.read(pocketBaseProvider);
  final records = await pb.collection('todo').getFullList();

  return [...records.map((r) => Todo(r.id, r.data['title']))];
}

@riverpod
Future<void> postVote(PostVoteRef ref, List<String> todoIds, DateTime dateTime) async {
  final pb = ref.read(pocketBaseProvider);
  final model = ref.read(recordModelProvider);

  final body = <String, dynamic>{
    'participants': model.id,
    'todo': [...todoIds],
    'datetime': dateTime.toString(),
  };

  await pb.collection('log').create(body: body);
}
