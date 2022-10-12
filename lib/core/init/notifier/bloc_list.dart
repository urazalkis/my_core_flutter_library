class ApplicationBloc {
  static ApplicationBloc? _instance;
  static ApplicationBloc get instance {
    _instance ??= ApplicationBloc._init();
    return _instance!;
  }

  ApplicationBloc._init();

  List<dynamic> dependItems = [
    /* BlocProvider(
      create: (context) => LoginCubit(),
      lazy: true,
    ),*/
  ];
}
