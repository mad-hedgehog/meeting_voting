import 'package:flutter/material.dart';
import 'package:meeting_voting/src/presentation/component/date_picker_button.dart';
import 'package:meeting_voting/src/presentation/component/radio_container.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MainPage> {
  final ScrollController _controller = ScrollController();

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
                  const DatePickerButton(),
                  const Divider(height: 64),
                  Text('누구세요?', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  RadioContainer(
                    onChanged: (values) {},
                    children: [
                      CustomRadio(label: '유은경', value: 0),
                      CustomRadio(label: '이해원', value: 1),
                      CustomRadio(label: '최승욱', value: 2),
                      CustomRadio(label: '홍정욱', value: 3),
                    ],
                  ),
                  const Divider(height: 64),
                  Text('오늘 성공한 일을 선택해주세요.', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  RadioContainer(
                    multiple: true,
                    onChanged: (values) {
                      print(values);
                    },
                    children: [
                      CustomRadio(label: '전날 야식 금지(21:00 이전)', value: 0),
                      CustomRadio(label: '운동', value: 1),
                      CustomRadio(label: '식사 중, 정제 탄수화물 1회 이상 안먹기', value: 2),
                      CustomRadio(label: '간식 안먹기(빵, 떡, 아이스크림)', value: 3),
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
                      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 8)),
                    ),
                    onPressed: () {},
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
