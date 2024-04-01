import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meeting_voting/src/presentation/feature/record/provider/record_provider.dart';
import 'package:meeting_voting/src/presentation/feature/record/view/record_page.dart';
import 'package:meeting_voting/src/presentation/feature/vote/view/vote_page.dart';

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
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    _onChangedPath();
  }

  @override
  void didUpdateWidget(covariant MainPage oldWidget) {
    super.didUpdateWidget(oldWidget);

    _onChangedPath();
  }

  void _onChangedPath() => setState(() {
        _selectedIndex = switch (widget.path) {
          'vote' => 0,
          'record' => 1,
          _ => 0,
        };
      });

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
                    const SizedBox(width: 16),
                    TextButton(
                      onPressed: () {
                        ref.invalidate(successfulRecordProvider);
                        GoRouter.of(context).go('/record');
                      },
                      child: const Text('기록'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  constraints: const BoxConstraints(maxWidth: 640),
                  height: double.infinity,
                  child: IndexedStack(
                    index: _selectedIndex,
                    children: const [
                      VotePage(),
                      RecordPage(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
