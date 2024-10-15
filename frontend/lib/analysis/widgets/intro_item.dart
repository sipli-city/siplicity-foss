import 'package:fluent_ui/fluent_ui.dart';

class IntroItem extends StatelessWidget {
  const IntroItem({super.key});

  @override
  Widget build(BuildContext context) {
    final int fileCount = 1;
    final int totalVolume = 1; 

    return Container(
        padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
        child: Text("There are $fileCount files in the workspace, with a total size of $totalVolume", style: FluentTheme.of(context).typography.title));
  }
}
