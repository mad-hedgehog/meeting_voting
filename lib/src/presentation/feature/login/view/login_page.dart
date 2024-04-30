import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:meeting_voting/resources/resources.dart';
import 'package:meeting_voting/src/core/color_system.dart';
import 'package:meeting_voting/src/core/text_system.dart';
import 'package:meeting_voting/src/presentation/component/button/button.dart';
import 'package:meeting_voting/src/presentation/component/mh_text_field.dart';
import 'package:meeting_voting/src/presentation/feature/login/provider/login_provider.dart';
import 'package:meeting_voting/src/presentation/feature/sign_up/view/sign_up_page.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  static const routeName = 'LoginPageRouteName';

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  Image.asset(Images.loginImage, fit: BoxFit.cover),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Column(
                      children: [
                        const Gap(40),
                        Text('JAKSIM', style: TextSystem.heading.h1),
                        const Gap(24),
                        MHTextField(
                          controller: _emailController,
                          placeholder: '이메일을 입력해주세요.',
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
                          placeholder: '비밀번호를 입력해주세요.',
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '비밀번호를 입력해주세요.';
                            }
                            return null;
                          },
                        ),
                        const Gap(16),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: 'Forgot password?',
                                style: TextSystem.action.m.copyWith(color: ColorSystem.highlight.darkest),
                                recognizer: TapGestureRecognizer()..onTap = () {},
                              ),
                            ]),
                          ),
                        ),
                        const Gap(24),
                        Button.primary(
                          expand: true,
                          height: 48,
                          child: const Text('로그인', style: TextStyle(color: Colors.white)),
                          onTap: () async {
                            if (!_formKey.currentState!.validate()) return;

                            final response = await ref.read(loginProvider(
                              _emailController.text,
                              _passwordController.text,
                            ).future);

                            if (response == false) {
                              _emailController.clear();
                              _passwordController.clear();
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('이메일 또는 비밀번호가 일치하지 않습니다.'),
                                  ),
                                );
                                return;
                              }
                            }

                            if (context.mounted) context.go('/vote');
                          },
                        ),
                        const Gap(16),
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(text: '아직 회원이 아니신가요? ', style: TextSystem.body.s.copyWith(color: ColorSystem.neutral.dark.light)),
                            TextSpan(
                              text: '회원가입',
                              style: TextSystem.action.m.copyWith(color: ColorSystem.highlight.darkest),
                              recognizer: TapGestureRecognizer()..onTap = () => context.goNamed(SignUpPage.routeName),
                            ),
                          ]),
                        ),
                        const Gap(24),
                        const Divider(color: Color(0xffd4d6dd)),
                        const Gap(64),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
