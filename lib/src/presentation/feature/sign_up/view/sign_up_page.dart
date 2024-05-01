import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:meeting_voting/src/core/color_system.dart';
import 'package:meeting_voting/src/core/extension/context_extension.dart';
import 'package:meeting_voting/src/core/text_system.dart';
import 'package:meeting_voting/src/presentation/component/button/button.dart';
import 'package:meeting_voting/src/presentation/component/mh_check_box.dart';
import 'package:meeting_voting/src/presentation/component/mh_text_field.dart';
import 'package:meeting_voting/src/presentation/feature/login/provider/login_provider.dart';
import 'package:meeting_voting/src/presentation/feature/sign_up/provider/sign_up_provider.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  static const routeName = 'SignUpPageRouteName';

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _isAgree = false;

  @override
  void dispose() {
    _nicknameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    const Gap(16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('회원가입', style: context.textSystem.heading.h3),
                          const Gap(8),
                          Text('기본 정보를 입력해주세요.', style: context.textSystem.body.s.copyWith(color: context.colorSystem.neutral.dark.light)),
                          const Gap(24),
                          MHTextField(
                            controller: _nicknameController,
                            title: '닉네임',
                            placeholder: 'nickname',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '닉네임을 입력해주세요.';
                              }
                              return null;
                            },
                          ),
                          const Gap(16),
                          MHTextField(
                            controller: _emailController,
                            title: '이메일',
                            placeholder: 'name@email.com',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '이메일을 입력해주세요.';
                              }
                              return null;
                            },
                          ),
                          const Gap(16),
                          MHTextField(
                            controller: _passwordController,
                            obscureText: true,
                            title: '비밀번호',
                            placeholder: 'Create a password',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '비밀번호를 입력해주세요.';
                              }
                              return null;
                            },
                          ),
                          const Gap(16),
                          MHTextField(
                            controller: _confirmPasswordController,
                            obscureText: true,
                            placeholder: 'Confirm password',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '비밀번호를 다시 입력해주세요.';
                              }
                              if (value != _passwordController.text) {
                                return '비밀번호가 일치하지 않습니다.';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    const Gap(24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(
                        children: [
                          MHCheckBox.medium(
                            checked: _isAgree,
                            onTap: () => setState(() {
                              _isAgree = !_isAgree;
                            }),
                            validator: (state) {
                              if (state == null || state == false) {
                                return '약관에 동의해주세요.';
                              }
                              return null;
                            },
                          ),
                          const Gap(12),
                          Flexible(
                            child: RichText(
                              text: TextSpan(
                                style: context.textSystem.body.s.copyWith(color: context.colorSystem.neutral.dark.light),
                                children: [
                                  const TextSpan(text: 'I\'ve read and agree with the '),
                                  TextSpan(
                                    text: 'Terms and Conditions',
                                    style: context.textSystem.action.m.copyWith(color: context.colorSystem.highLight.darkest),
                                    recognizer: TapGestureRecognizer()..onTap = () {},
                                  ),
                                  const TextSpan(text: ' and the '),
                                  TextSpan(
                                    text: 'Privacy Policy',
                                    style: context.textSystem.action.m.copyWith(color: context.colorSystem.highLight.darkest),
                                    recognizer: TapGestureRecognizer()..onTap = () {},
                                  ),
                                  const TextSpan(text: '.'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Button.primary(
                        expand: true,
                        height: 48,
                        child: const Text('회원가입'),
                        onTap: () async {
                          if (_formKey.currentState?.validate() == false) return;

                          final response = await ref.read(signUpProvider(
                            nickname: _nicknameController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                          ).future);

                          if (response is Map<String, dynamic>) {
                            if (response.containsKey('nickname')) {
                              _nicknameController.clear();
                            }
                            if (response.containsKey('email')) {
                              _emailController.clear();
                            }
                          } else {
                            await ref.read(loginProvider(
                              _emailController.text,
                              _passwordController.text,
                            ).future);

                            if (context.mounted) context.go('/vote');
                          }
                        },
                      ),
                    ),
                    const Gap(64),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
