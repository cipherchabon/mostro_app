import '../../widgets/widgets.dart';

class MostroApp extends ConsumerStatefulWidget {
  const MostroApp({super.key});

  @override
  ConsumerState<MostroApp> createState() => _MostroAppState();
}

class _MostroAppState extends ConsumerState<MostroApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Mostro App',
      routerConfig: mainRouter,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
