import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaseView<T extends Cubit> extends StatefulWidget {
  final Function(
    T modelRead,
  ) init;
  final Widget Function(BuildContext context, T modelRead, T modelWatch)
      onPageBuilder;
  final Function(T modelRead)? dispose;
  const BaseView(
      {Key? key, required this.init, required this.onPageBuilder, this.dispose})
      : super(key: key);

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends Cubit> extends State<BaseView<T>> {
  late T modelRead;
  late T modelWatch;

  @override
  void initState() {
    //model = widget.viewModel;
    modelRead = context.read<T>();
    //modelWatch = context.watch<T>();
    widget.init(modelRead);

    super.initState();
  }

  @override
  void dispose() {
    // model = widget.viewModel;
    modelRead = context.read<T>();
    if (widget.dispose != null) widget.dispose!(modelRead);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    modelRead = context.read<T>();
    modelWatch = context.watch<T>();
    return widget.onPageBuilder(context, modelRead, modelWatch);
  }
}
