import 'package:flutter/cupertino.dart';
import 'package:yaya_news/core/abstract_base_viewmodel.dart';

class ViewModelProvider<T extends BaseViewModel> extends StatefulWidget {
  final T viewModel;
  final Widget child;

  ViewModelProvider({@required this.viewModel, @required this.child});

  static T of<T extends BaseViewModel>(BuildContext context) {
    final type = _typeOf<ViewModelProvider<T>>();
    ViewModelProvider<T> provider = context.ancestorWidgetOfExactType(type);
    return provider.viewModel;
  }

  static Type _typeOf<T>() => T;

  @override
  State<StatefulWidget> createState() => _ViewModelProviderState();
}

class _ViewModelProviderState extends State<ViewModelProvider> {
  @override
  Widget build(BuildContext context) => widget.child;

  @override
  void dispose() {
    widget.viewModel.dispose();
    super.dispose();
  }
  
}
