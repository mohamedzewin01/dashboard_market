
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/di/di.dart';
import 'core/resources/myTheme.dart';
import 'core/resources/routes_manager.dart';
import 'core/utils/cashed_data_shared_preferences.dart';
import 'core/utils/my_bloc_observer.dart';
import 'l10n/app_localizations.dart';
import 'localization/locale_cubit.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheService.cacheInitialization();
  configureDependencies();
  // Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
  // runApp(DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder: (context) => MyApp(),
  // ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocaleCubit(),
      child: BlocBuilder<LocaleCubit, Locale>(
        builder: (context, locale) {
          return MaterialApp(
            locale: locale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              // Locale('en'),
              Locale('ar'),
            ],
            theme: AppThemes.lightTheme1,
            themeMode: ThemeMode.light,
            debugShowCheckedModeBanner: false,

            onGenerateRoute: RouteGenerator.getRoute,
            initialRoute: RoutesManager.splashScreen,

            // products: SplashScreen(),
          );
        },
      ),
    );
  }
}

