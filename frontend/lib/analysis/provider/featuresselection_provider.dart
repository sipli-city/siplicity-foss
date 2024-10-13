import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:siplicity/protogen/siplicity/v1/siplicity.pb.dart';

part 'featuresselection_provider.g.dart';

@Riverpod(keepAlive: true)
class FeaturesSelection extends _$FeaturesSelection {
  @override
  Iterable<int> build(ReportType report) {
    return [];
  }

  void selectionChanged(Iterable<int> selection) {
    state = selection;
  }
}
