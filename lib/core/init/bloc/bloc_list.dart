import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/init/bloc/bloc_theme.dart';

class ApplicationBloc {
  static ApplicationBloc? _instance;
  static ApplicationBloc get instance {
    _instance ??= ApplicationBloc._init();
    return _instance!;
  }

  ApplicationBloc._init();

  List<dynamic> dependItems = [
    BlocProvider(
      create: (context) => ThemeCubit(),
    ),
  ];
}
