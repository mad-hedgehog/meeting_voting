import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meeting_voting/src/presentation/common/provider.dart';
import 'package:meeting_voting/src/presentation/feature/record/provider/record_provider.dart';
import 'package:meeting_voting/src/presentation/feature/record/view/record_page.dart';
import 'package:meeting_voting/src/presentation/feature/setting/view/setting_page.dart';
import 'package:meeting_voting/src/presentation/feature/vote/view/vote_page.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({
    super.key,
    required this.path,
  });

  final String? path;

  @override
  ConsumerState<MainPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                constraints: const BoxConstraints(maxWidth: 640),
                height: 56,
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () => GoRouter.of(context).go('/vote'),
                      child: const Text('투표'),
                    ),
                    const SizedBox(width: 4),
                    TextButton(
                      onPressed: () {
                        ref.invalidate(recordsProvider);
                        GoRouter.of(context).go('/record');
                      },
                      child: const Text('기록'),
                    ),
                    const SizedBox(width: 4),
                    TextButton(
                      onPressed: () {
                        GoRouter.of(context).go('/setting');
                      },
                      child: const Text('설정'),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () async {
                        ref.read(logoutProvider);
                        await ref.read(deleteTokenProvider.future);
                        if (context.mounted) {
                          GoRouter.of(context).go('/login');
                        }
                      },
                      child: const Text('Logout'),
                    ),
                    IconButton(
                      onPressed: () async {
                        if (await launchUrl(Uri.parse('https://personal-pocketbase.5rj6sc.easypanel.host/_')) && context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('관리 페이지로 이동할 수 없습니다.')));
                        }
                      },
                      icon: const Icon(Icons.admin_panel_settings_outlined),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  constraints: const BoxConstraints(maxWidth: 640),
                  height: double.infinity,
                  child: switch (widget.path) {
                    'vote' => const VotePage(),
                    'record' => const RecordPage(),
                    'setting' => const SettingPage(),
                    _ => const VotePage(),
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
