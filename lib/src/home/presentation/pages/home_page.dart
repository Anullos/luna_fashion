import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/application/providers.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    ref.read(userController.notifier).loadUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userController).user;
    return Scaffold(
      appBar: AppBar(
        title: Text(user != null ? user.fullName : 'Home'),
      ),
      body: Center(
        child: Text(user != null ? user.email : 'Home'),
      ),
    );
  }
}
