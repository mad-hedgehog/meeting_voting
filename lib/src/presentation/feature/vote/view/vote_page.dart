import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meeting_voting/src/presentation/common/provider.dart';
import 'package:meeting_voting/src/presentation/component/date_picker_button.dart';
import 'package:meeting_voting/src/presentation/component/radio_container.dart';
import 'package:meeting_voting/src/presentation/feature/record/provider/record_provider.dart';
import 'package:meeting_voting/src/presentation/feature/vote/component/submit_button.dart';
import 'package:meeting_voting/src/presentation/feature/vote/provider/vote_provider.dart';

class VotePage extends ConsumerStatefulWidget {
  const VotePage({super.key});

  @override
  ConsumerState<VotePage> createState() => _VotePageState();
}

class _VotePageState extends ConsumerState<VotePage> {
  final ScrollController _controller = ScrollController();

  DateTime _dateTime = DateTime.now();
  List<String> _todoIds = [];

  void _setSuccesses(List<dynamic> values) {
    if (values is List<String> == false) return;
    _todoIds = List<String>.from(values);
  }

  Future _postLog() async {
    final result = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('제출하시겠습니까?'),
        content: const Text('제출하시면 수정할 수 없습니다.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('취소'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('확인'),
          ),
        ],
      ),
    );

    if (result == false) return;

    await ref.read(postVoteProvider(_todoIds, _dateTime).future);

    if (mounted) {
      ref.invalidate(recordsProvider);
      GoRouter.of(context).go('/record');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            controller: _controller,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                Consumer(
                  builder: (context, ref, _) {
                    final model = ref.read(recordModelProvider);
                    final name = model.data['name'];

                    return Text('안녕하세요. $name님', style: Theme.of(context).textTheme.titleMedium);
                  },
                ),
                const Divider(height: 48),
                Text('날짜를 선택해 주세요.', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                DatePickerButton(
                  dateTime: _dateTime,
                  onChanged: (date) {
                    setState(() {
                      _dateTime = date;
                    });
                  },
                ),
                const Divider(height: 48),
                Text('오늘 성공한 일을 선택해 주세요.', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                Consumer(
                  builder: (context, ref, child) {
                    final todos = ref.watch(todosProvider);

                    return switch (todos) {
                      AsyncData(:final value) => RadioContainer<String>(
                          multiple: true,
                          wrap: true,
                          onChanged: _setSuccesses,
                          children: [
                            ...value.map((p) => CustomRadio(label: p.title, value: p.id)),
                          ],
                        ),
                      _ => const SizedBox(),
                    };
                  },
                ),
                const SizedBox(height: 32),
                SubmitButton(onPressed: _postLog),
                const SizedBox(height: 64),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
