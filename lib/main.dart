import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:vidflix/firebase_options.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vidflix/firebase_options.dart';
import 'package:vidflix/routes/routes.dart';
import 'package:vidflix/screens/home_screen.dart';
import 'package:vidflix/screens/onboarding_screen.dart';
import 'package:vidflix/services/firebase_auth_methods.dart';
import 'package:vidflix/services/firebase_authservice.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseAuthMethod>(
          create: (context) => FirebaseAuthMethod(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<FirebaseAuthMethod>().authState,
          initialData: null,
        ),
        ChangeNotifierProvider<FirebaseAuthServices>(
          create: (context) => FirebaseAuthServices(),
        )
      ],
      child: MaterialApp(
        initialRoute: RoutesManager.authWrapper,
        onGenerateRoute: RoutesManager.getRoute,
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: GoogleFonts.openSans().fontFamily,
        ),
        // home: const OnboardingScreen(),
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<FirebaseAuthMethod>().user;

    if (firebaseUser != null && firebaseUser.emailVerified) {
      //devtools.log(firebaseUser.toString());
      return const HomeScreen();
    } else {
      // devtools.log(firebaseUser.toString());
      return const OnboardingScreen();
    }
  }
}
