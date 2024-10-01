import 'package:fluent_ui/fluent_ui.dart';
import 'package:siplicity/workspace/widgets/command_bars.dart';
import 'package:siplicity/workspace/widgets/record_trees.dart';

class RecordsPage extends StatelessWidget {
  const RecordsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Expanded(child: InputCommandBar()),
            SizedBox(height: 24.0, width: 36.0),
            Expanded(child: OutputCommandBar())
          ],
        ),
        Expanded(
            child: Row(children: [
          Expanded(
              child: Container(
                  padding: const EdgeInsets.only(top: 8.0),
                  alignment: Alignment.topLeft,
                  child:
                      const SingleChildScrollView(child: InputRecordsTree()))),
          Container(
              decoration: const BoxDecoration(
                  border: Border(
                      left: BorderSide(color: Color(0x0f000000)),
                      right: BorderSide(color: Color(0x0f000000)))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(FluentIcons.double_chevron_right,
                        size: 24.0),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon:
                        const Icon(FluentIcons.double_chevron_left, size: 24.0),
                    onPressed: () {},
                  ),
                ],
              )),
          Expanded(
              child: Container(
                  padding: const EdgeInsets.only(top: 8.0),
                  alignment: Alignment.topLeft,
                  child:
                      const SingleChildScrollView(child: OutputRecordsTree())))
        ]))
      ],
    );
  }
}
