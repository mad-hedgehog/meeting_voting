import 'package:flutter/material.dart';
import 'package:meeting_voting/src/presentation/component/date_picker_button.dart';
import 'package:meeting_voting/src/presentation/component/radio_container.dart';
import 'package:meeting_voting/src/presentation/model/participants.dart';
import 'package:meeting_voting/src/presentation/model/todo.dart';
import 'package:pocketbase/pocketbase.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MainPage> {
  final ScrollController _controller = ScrollController();

  DateTime _dateTime = DateTime.now();
  String? _participantsId;
  List<String> _todoIds = [];

  List<Participants>? _participants;
  List<Todo>? _todos;

  final pb = PocketBase('https://personal-pocketbase.5rj6sc.easypanel.host');

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

    _fetch();
  }

  void _fetch() async {
    await Future.wait([_fetchParticipants(), _fetchTodos()]);

    setState(() {});
  }

  Future _fetchParticipants() async {
    final records = await pb.collection('participants').getFullList();

    _participants = [...records.map((r) => Participants(r.id, r.data['name']))];
  }

  Future _fetchTodos() async {
    final records = await pb.collection('todo').getFullList();

    _todos = [...records.map((r) => Todo(r.id, r.data['title']))];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          constraints: const BoxConstraints(maxWidth: 640),
          height: double.infinity,
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              controller: _controller,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 64),
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
                  RadioContainer<String>(
                    onChanged: _setName,
                    wrap: true,
                    children: [
                      ...?_participants?.map((p) => CustomRadio(label: p.name, value: p.id)),
                    ],
                  ),
                  const Divider(height: 64),
                  Text('오늘 성공한 일을 선택해주세요.', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  RadioContainer<String>(
                    multiple: true,
                    wrap: true,
                    onChanged: _setSuccesses,
                    children: [
                      ...?_todos?.map((p) => CustomRadio(label: p.title, value: p.id)),
                    ],
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    style: ButtonStyle(
                      splashFactory: NoSplash.splashFactory,
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0))),
                      backgroundColor: MaterialStateProperty.all<Color?>(Colors.white),
                      overlayColor: MaterialStateProperty.all<Color?>(const Color(0xfffefefe)),
                      shadowColor: MaterialStateProperty.all<Color?>(Colors.white),
                      surfaceTintColor: MaterialStateProperty.all<Color?>(Colors.white),
                      padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(horizontal: 8)),
                    ),
                    onPressed: switch (_participantsId) {
                      null => null,
                      _ => () async {
                          final body = <String, dynamic>{
                            'participants': _participantsId,
                            'todo': [..._todoIds],
                            'datetime': _dateTime.toString(),
                          };

                          final record = await pb.collection('log').create(body: body);
                        },
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Submit'),
                        SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward_rounded,
                          size: 14,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 64),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
