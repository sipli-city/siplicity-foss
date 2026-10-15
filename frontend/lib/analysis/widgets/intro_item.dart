import 'package:fluent_ui/fluent_ui.dart';

class IntroItem extends StatelessWidget {
  final String title;
  const IntroItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
      child: Text(title, style: FluentTheme.of(context).typography.title),
    );
  }
}
