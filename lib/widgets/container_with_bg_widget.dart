import 'package:flutter/material.dart';

class ContainerWithBgWidget extends StatelessWidget {
  const ContainerWithBgWidget({required this.child,Key? key}) : super(key: key);
final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bg.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(child: child,),
    );
  }
}
