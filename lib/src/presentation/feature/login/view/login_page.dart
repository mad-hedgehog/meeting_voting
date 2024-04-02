import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meeting_voting/src/presentation/common/provider.dart';
import 'package:meeting_voting/src/presentation/feature/login/provider/login_provider.dart';
import 'package:pinput/pinput.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  String? _selectedId;
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            constraints: const BoxConstraints(maxWidth: 640),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Consumer(
                  builder: (context, ref, _) {
                    final users = ref.watch(usersProvider);

                    return switch (users) {
                      AsyncData(:final value) => Wrap(
                          spacing: 32,
                          runSpacing: 16,
                          children: [
                            ...value.map(
                              (user) => GestureDetector(
                                onTap: () {
                                  _controller.clear();
                                  setState(() {
                                    if (_selectedId == user.id) {
                                      _selectedId = null;
                                      _focusNode.unfocus();
                                    } else {
                                      _selectedId = user.id;
                                      _focusNode.requestFocus();
                                    }
                                  });
                                },
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 32,
                                      backgroundColor: _selectedId == user.id ? Colors.grey[900] : Colors.grey[300],
                                      child: Text(user.name[0], style: TextStyle(fontSize: 20, color: _selectedId == user.id ? Colors.white : Colors.black)),
                                    ),
                                    Text(user.name),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      _ => const CircularProgressIndicator(),
                    };
                  },
                ),
                const SizedBox(height: 32),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: _selectedId == null ? 0 : 56,
                  curve: Curves.easeInOut,
                  child: Pinput(
                    length: 6,
                    focusNode: _focusNode,
                    controller: _controller,
                    onCompleted: (password) async {
                      final userName = (await ref.read(usersProvider.future)).firstWhere((user) => user.id == _selectedId).userName;

                      try {
                        await ref.read(loginProvider(userName, password).future);
                      } catch (e) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('로그인에 실패했습니다. 다시 시도해주십시오.'),
                              action: SnackBarAction(label: '확인', onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar()),
                            ),
                          );
                        }
                      }

                      if (ref.read(pocketBaseProvider).authStore.isValid && context.mounted) {
                        GoRouter.of(context).go('/vote');
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
