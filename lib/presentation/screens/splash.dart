import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/presentation/providers/navigation.dart';

class SplashScreen extends  ConsumerStatefulWidget{
  @override
  _SplashScreenState createState()=> _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>{



  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome(){
    final navigationservice= ref.read(navigationServiceProvider);
    Timer(const Duration(seconds: 2), (){
      navigationservice.navigateToHomeScreen(context);
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:  const Color(0xFF212121),
      body: Center(
          child:
          Image.asset('assets/images/IconMovieSF.png',height: 100,width: 100,)
      ),
    );
  }
  
}
