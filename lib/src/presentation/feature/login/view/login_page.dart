import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:meeting_voting/resources/resources.dart';
import 'package:meeting_voting/src/core/text_system.dart';
import 'package:meeting_voting/src/presentation/component/button/button.dart';
import 'package:meeting_voting/src/presentation/component/mh_text_field.dart';
import 'package:meeting_voting/src/presentation/feature/sign_up/view/sign_up_page.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: ListView(
              children: [
                Image.asset(Images.loginImage, fit: BoxFit.cover),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    children: [
                      const Gap(40),
                      Text('JAKSIM', style: textSystem.heading.h1),
                      const Gap(24),
                      MHTextField(
                        controller: _emailController,
                        placeholder: '이메일을 입력해주세요.',
                      ),
                      const Gap(16),
                      MHTextField(
                        controller: _passwordController,
                        placeholder: '비밀번호를 입력해주세요.',
                        obscureText: true,
                      ),
                      const Gap(16),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Button.tertiary(
                          textStyle: const TextStyle(fontWeight: FontWeight.w600),
                          child: const Text('Forgot password?'),
                          onTap: () {},
                        ),
                      ),
                      const Gap(24),
                      Button.primary(
                        expand: true,
                        height: 48,
                        child: const Text('로그인', style: TextStyle(color: Colors.white)),
                        onTap: () {},
                      ),
                      const Gap(16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('아직 회원이 아니신가요? ', style: TextStyle(color: Color(0xff71727a), fontWeight: FontWeight.w400)),
                          Button.tertiary(
                            textStyle: const TextStyle(fontWeight: FontWeight.w600),
                            child: const Text('회원가입'),
                            onTap: () => context.goNamed(SignUpPage.routeName),
                          ),
                        ],
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
    );
  }
}
