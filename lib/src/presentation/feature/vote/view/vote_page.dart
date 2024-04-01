import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meeting_voting/src/presentation/common/provider.dart';
import 'package:meeting_voting/src/presentation/component/date_picker_button.dart';
import 'package:meeting_voting/src/presentation/component/radio_container.dart';
import 'package:meeting_voting/src/presentation/feature/vote/component/submit_button.dart';
import 'package:meeting_voting/src/presentation/feature/vote/provider/vote_provider.dart';
import 'package:pocketbase/pocketbase.dart';

class VotePage extends ConsumerStatefulWidget {
  const VotePage({super.key});

  @override
  ConsumerState<VotePage> createState() => _VotePageState();
}

class _VotePageState extends ConsumerState<VotePage> {
  final ScrollController _controller = ScrollController();

  DateTime _dateTime = DateTime.now();
  String? _participantsId;
  List<String> _todoIds = [];

  late final PocketBase pb;

  void _setName(List<dynamic> names) {
    if (names is List<String> == false) return;
    if (names.isEmpty) {
      setState(() {
        _participantsId = null;
      });
    } else {
      setState(() {
        _participantsId = names.first;
      });
    }
  }

  void _setSuccesses(List<dynamic> values) {
    if (values is List<String> == false) return;
    _todoIds = List<String>.from(values);
  }

  @override
  void initState() {
    super.initState();

    pb = ref.read(pocketBaseProvider);
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

    await ref.read(postVoteProvider(_participantsId!, _todoIds, _dateTime).future);

    _dateTime = DateTime.now();
    _participantsId = null;
    _todoIds = [];

    setState(() {});

    if (mounted) {
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
                Text('살 빼면 난리나는 모임 투표', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 16),
                DatePickerButton(
                  dateTime: _dateTime,
                  onChanged: (date) {
                    setState(() {
                      _dateTime = date;
                    });
                  },
                ),
                const Divider(height: 64),
                Text('누구세요?', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                Consumer(
                  builder: (context, ref, child) {
                    final participants = ref.watch(participantsProvider);

                    return switch (participants) {
                      AsyncData(:final value) => RadioContainer<String>(
                          onChanged: _setName,
                          wrap: true,
                          children: [
                            ...value.map((p) => CustomRadio(label: p.name, value: p.id)),
                          ],
                        ),
                      _ => const SizedBox(),
                    };
                  },
                ),
                const Divider(height: 64),
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
                SubmitButton(
                  onPressed: switch (_participantsId) {
                    null => null,
                    _ => _postLog,
                  },
                ),
                const SizedBox(height: 64),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
