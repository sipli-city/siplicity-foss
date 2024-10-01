//import 'package:fluent_ui/fluent_ui.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
//import 'package:siplicity/protogen/siplicity/v1/siplicity.pb.dart';

part 'treeselection_provider.g.dart';

@riverpod
class InputSelection extends _$InputSelection {
  List<int> selection = <int>[];
  
  @override
  List<int> build() {
    return selection;
  }

  void update(List<int> list) {
    selection = list;
  } 
}
