import 'package:flutter/material.dart';
import 'package:meeting_voting/src/presentation/component/button.dart';
import 'package:meeting_voting/src/presentation/component/date_picker_button.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: ListView(
              children: [
                const SizedBox(height: 60),
                Text('타이틀', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 16),
                const DatePickerButton(),
                const Divider(height: 64),
                Text('누구세요?', style: Theme.of(context).textTheme.titleMedium),
                const Divider(height: 64),
                Text('오늘 성공한 일을 선택해주세요.', style: Theme.of(context).textTheme.titleMedium),
                Button(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
