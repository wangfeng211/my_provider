import 'package:flutter/material.dart';
import 'package:my_provider/models/user_info_model.dart';
import 'package:my_provider/my_provider/my_provider.dart';

class MinePage extends StatefulWidget {
  const MinePage({super.key});

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    final userModel = context.watch<UserInfoModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("个人中心-展示个人信息"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: const Text('姓名'),
              trailing: Text(userModel.name, style: const TextStyle(fontSize: 20),),
            ),
            ListTile(
              title: const Text('手机号'),
              trailing: Text(userModel.showPhone
                  ? userModel.phone
                  : userModel.phone.replaceRange(3, userModel.phone.length,
                  '*' * (userModel.phone.length - 3)),style: const TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
