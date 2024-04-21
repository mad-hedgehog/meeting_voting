import 'package:meeting_voting/src/presentation/common/provider.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_up_provider.g.dart';

@riverpod
Future<dynamic> signUp(SignUpRef ref, {required String nickname, required String email, required String password}) async {
  final pb = ref.read(pocketBaseProvider);

  final body = <String, dynamic>{
    "username": nickname,
    "email": email,
    "emailVisibility": true,
    "password": password,
    "passwordConfirm": password,
  };

  try {
    await pb.collection('users').create(body: body);

    return true;
  } on ClientException catch (e) {
    final error = e.response['data'];
    final String? email = error['email']?['message'];
    final String? nickname = error['username']?['message'];
    final Map<String, dynamic> errorMap = {};

    if (email != null) {
      errorMap['email'] = email;
    }
    if (nickname != null) {
      errorMap['nickname'] = nickname;
    }

    return errorMap;
  }
}
