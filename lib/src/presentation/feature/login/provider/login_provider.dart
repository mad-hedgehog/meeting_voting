import 'package:meeting_voting/src/presentation/common/provider.dart';
import 'package:meeting_voting/src/presentation/model/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_provider.g.dart';

@riverpod
Future<List<User>> users(UsersRef ref) async {
  final pb = ref.read(pocketBaseProvider);

  final users = await pb.collection('users').getFullList(
        sort: 'name',
      );

  return users.map((e) => User(id: e.id, userName: e.data['username'], name: e.data['name'])).toList();
}

@riverpod
Future<void> login(LoginRef ref, String userName, String password) async {
  final pb = ref.read(pocketBaseProvider);

  await pb.collection('users').authWithPassword(userName, password);

  if (pb.authStore.isValid) {
    ref.read(writeTokenProvider(pb.authStore.token));
  }
}
