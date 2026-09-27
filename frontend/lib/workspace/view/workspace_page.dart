import 'package:fluent_ui/fluent_ui.dart';
import 'package:siplicity/workspace/widgets/command_bars.dart';
import 'package:siplicity/workspace/widgets/record_trees.dart';

class RecordsPage extends StatelessWidget {
  const RecordsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Row(children: [Expanded(child: InputCommandBar()), SizedBox(width: 28.0), Expanded(child: InputCommandBar())],),
      Expanded(child: 
      Row(children: [const SingleChildScrollView(child: InputRecordsBody()), 
                          SizedBox(width: 28.0, 
      child: Column(children: [IconButton(
                        icon: const Icon(FluentIcons.double_chevron_right, size: 24.0),
                        onPressed: (){},
                              ),
                               IconButton(
                        icon: const Icon(FluentIcons.double_chevron_left, size: 24.0),
                        onPressed: (){},
                      ),]),),
                      const SingleChildScrollView(child: OutputRecordsBody())]))
    ],);
    
    
    /*ScaffoldPage(
        padding: EdgeInsets.zero,
        header: Container(
          color: FluentTheme.of(context).activeColor,
          padding: const EdgeInsets.all(12.0),
          child: const InputCommandBar(),
        ),
        content: SingleChildScrollView(
            child: Container(
                color: FluentTheme.of(context).activeColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Expanded(child: InputRecordsBody()),
                    Column(children: [
                      IconButton(
                        icon: const Icon(FluentIcons.double_chevron_right,
                            size: 24.0),
                        onPressed: () => debugPrint('pressed button'),
                      ),
                      IconButton(
                        icon: const Icon(FluentIcons.double_chevron_left,
                            size: 24.0),
                        onPressed: () => debugPrint('pressed button'),
                      ),
                    ]),
                    const Expanded(child: OutputRecordsBody()),
                  ],
                ))));*/
  }
}
