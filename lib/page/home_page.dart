import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_provider/models/user_info_model.dart';
import 'package:my_provider/my_provider/my_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userModel = context.watch<UserInfoModel>();

    _nameController.text = userModel.name;
    _phoneController.text = userModel.phone;
    bool showPhone = userModel.showPhone;
    return Scaffold(
      appBar: AppBar(
        title:const Text("首页-设置个人信息"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const Text("姓名："),
                Expanded(
                    child: CupertinoTextField(
                      onChanged: (v) => userModel.name = v,
                      controller: _nameController,
                      placeholder: "请输入姓名",
                    ))
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                const Text("手机号："),
                Expanded(
                  child: CupertinoTextField(
                    maxLength: 11,
                    onChanged: (v) => userModel.phone = v,
                    controller: _phoneController,
                    placeholder: "手机号",
                  ),
                )
              ],
            ),
            const SizedBox(height: 20,),

            Row(
              children: [
                const Text("隐藏手机号："),
                Switch(
                    value: showPhone,
                    onChanged: (val) {
                      setState(() => userModel.showPhone = val);
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
