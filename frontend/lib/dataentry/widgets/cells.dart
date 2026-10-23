import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:siplicity/details/provider/fieldpaths_provider.dart';

class DataEntryHeaderCell extends StatelessWidget {
  final double width;
  final String title;
  const DataEntryHeaderCell(
      {super.key, required this.width, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 4),
        height: 25,
        width: width,
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Color(0x0f000000)))),
        child:
            Text(title, style: FluentTheme.of(context).typography.bodyStrong));
  }
}

class DataEntryTextCell extends StatelessWidget {
  final double width;
  final String text;
  const DataEntryTextCell({super.key, required this.width, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(4.0),
        width: width,
        decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              right: BorderSide(color: Color(0x0f000000)),
              bottom: BorderSide(color: Color(0x0f000000)),
            )),
        child: Text(text));
  }
}

class DataEntryEditableCell extends ConsumerWidget {
  final double width;
  final String text;
  final int id;
  final int index;
  const DataEntryEditableCell(
      {super.key,
      required this.width,
      required this.text,
      required this.id,
      required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final TextEditingController controller = TextEditingController();
    return Container(
        padding: EdgeInsets.all(4.0),
        width: width,
        decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              right: BorderSide(color: Color(0x0f000000)),
              bottom: BorderSide(color: Color(0x0f000000)),
            )),
        child: TextBox(
            // controller: controller,
            onChanged: (str) {
              if (str == text) {
                return;
              }
              ref.read(fieldpathsProvider.notifier).putValue(id, index, str);
            },
            placeholder: text));
  }
}
