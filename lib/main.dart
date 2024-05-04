


import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shoesly_app/firebase_options.dart';
import 'package:shoesly_app/main/app.dart';
import 'package:shoesly_app/src/cart/domain/model/cart_model.dart';
import 'package:shoesly_app/src/discover/domain/models/shoe_model.dart';

import 'src/review/domain/model/review_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  Hive.registerAdapter(CartModelAdapter());
  Hive.registerAdapter(ShoeModelAdapter());
  Hive.registerAdapter(ReviewModelAdapter());
  await Hive.openBox<CartModel>('cartBox');
  await ScreenUtil.ensureScreenSize();
  runApp(MainApp());
}




