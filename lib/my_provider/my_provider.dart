import 'package:flutter/material.dart';

class MyProvider<T extends Listenable> extends StatefulWidget {
  final T Function() create;
  final Widget child;

  const MyProvider({required this.create, required this.child, super.key});

  static T of<T>(BuildContext context, {required bool listen}) {
    if (listen) {
      return context.dependOnInheritedWidgetOfExactType<_MyInheritedWidget<T>>()!.model;
    } else {
      return context.getInheritedWidgetOfExactType<_MyInheritedWidget<T>>()!.model;
    }
  }

  @override
  State<MyProvider> createState() => _MyProviderState<T>();
}

class _MyProviderState<T extends Listenable> extends State<MyProvider<T>> {
  late T model;

  @override
  void initState() {
    super.initState();
    model = widget.create();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: model,
        builder: (context, child) {
          return _MyInheritedWidget(model: model, child: widget.child);
        });
  }
}

class _MyInheritedWidget<T> extends InheritedWidget {
  final T model;

  const _MyInheritedWidget({
    super.key,
    required this.model,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

extension Comsumer on BuildContext {
  //监听model 变化
  T watch<T>() => MyProvider.of<T>(this, listen: true);

  //不监听model 变化
  T get<T>() =>MyProvider.of<T>(this, listen: false);
}
