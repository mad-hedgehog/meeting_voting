import 'package:pocketbase/pocketbase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'provider.g.dart';

const tokenUUID = 'b978dc7b-4432-4f29-9014-16cdcaec3888';

@Riverpod(keepAlive: true)
PocketBase pocketBase(PocketBaseRef ref) => PocketBase('https://personal-pocketbase.5rj6sc.easypanel.host');

@riverpod
RecordModel recordModel(RecordModelRef ref) {
  final pb = ref.read(pocketBaseProvider);
  return pb.authStore.model as RecordModel;
}

@riverpod
bool isAuth(IsAuthRef ref) => ref.read(pocketBaseProvider).authStore.isValid;

@riverpod
Future<void> logout(LogoutRef ref) async {
  final pb = ref.read(pocketBaseProvider);

  pb.authStore.clear();
}

@riverpod
Future<void> verification(VerificationRef ref, String token) async {
  final pb = ref.read(pocketBaseProvider);

  await pb.collection('users').authRefresh(
    headers: {'Authorization': token},
  );
}

@riverpod
Future<void> writeToken(WriteTokenRef ref, String token) async {
  const storage = FlutterSecureStorage();

  await storage.write(key: tokenUUID, value: token);
}

@riverpod
Future<String?> readToken(ReadTokenRef ref) async {
  const storage = FlutterSecureStorage();

  final token = await storage.read(key: tokenUUID);

  return token;
}

@riverpod
Future<void> deleteToken(DeleteTokenRef ref) async {
  const storage = FlutterSecureStorage();

  await storage.delete(key: tokenUUID);
}
