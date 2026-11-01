import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:siplicity/settings/provider/license_provider.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  String key = "";
  String license = "";

  @override
  Widget build(BuildContext context) {
    final licCheck = ref.watch(licenseProvider);
    return switch (licCheck) {
      AsyncData(:final value) => SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                child: Text("Settings",
                    style: FluentTheme.of(context).typography.subtitle)),
            Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                decoration: const BoxDecoration(
                    border: Border(top: BorderSide(color: Color(0x0f000000)))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.all(5),
                        child: Text("License",
                            style:
                                FluentTheme.of(context).typography.bodyLarge)),
                    Padding(
                        padding: EdgeInsets.all(3),
                        child: InfoBar(
                          title: const Text('License status'),
                          content: Text(value.$2),
                          severity: value.$1
                              ? InfoBarSeverity.success
                              : InfoBarSeverity.warning,
                        )),
                    Container(
                        padding: EdgeInsets.all(3),
                        width: 400,
                        child: InfoLabel(
                            label: 'License key:',
                            child: TextBox(
                              controller: TextEditingController(text: value.$3),
                              placeholder:
                                  "E.g. C1B6DE-39A6E3-DE1529-8559A0-4AF593-V3",
                              onChanged: (value) {
                                key = value;
                              },
                            ))),
                    Container(
                        padding: EdgeInsets.all(3),
                        width: 400,
                        height: 400,
                        child: Align(
                          child: InfoLabel(
                              label: 'License file:',
                              child: TextBox(
                                maxLines: 50,
                                controller:
                                    TextEditingController(text: value.$4),
                                placeholder: """-----BEGIN LICENSE FILE-----
eyJlbmMiOiJsSTc4N0QwcGZua1RvRDVOSjFpRXlaU093Q09QQ0NOdktKZHpCMlpSYlZBQzVsQUhjdzJSUi8xTEhrcXc0ZG5rUEl3TFVYRzhmUzk1R0JWTmtzd2JDTmllWm1uOElHeGpkbUY2T1RmNjRzOHlpbFRpL3FlUzJSTlhBdGJBWjUwTlJWWGp6Ym5DRkF6V3lOU3NUeG9xZm9MV2FlWlhITEZnR21Ub2VBdz09Iiwi
YWxnIjoiYWVzLTI1Ni1nY20rZWQyNTUxOSJ9 
-----END LICENSE FILE-----""",
                                onChanged: (value) {
                                  license = value;
                                },
                              )),
                        )),
                    FilledButton(
                      child: const Text('Update license'),
                      onPressed: () => ref
                          .read(licenseProvider.notifier)
                          .putLicense(key, license),
                    )
                  ],
                )),
          ],
        )),
      _ => const Padding(padding: EdgeInsets.all(8.0), child: Text('loading'))
    };
  }
}
