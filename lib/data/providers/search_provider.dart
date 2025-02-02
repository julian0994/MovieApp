import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchProvider=StateProvider<String>((ref)=>"");
final searchVisibilityProvider=StateProvider<bool>((ref)=>false);