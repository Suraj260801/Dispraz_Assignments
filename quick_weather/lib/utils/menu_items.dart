import 'package:flutter/material.dart';
class MenuItems extends StatelessWidget {

  const MenuItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(mainAxisAlignment: MainAxisAlignment.end,
      children: [
        PopupMenuButton(
          itemBuilder: (context) => [
            PopupMenuItem(
              onTap: () async {
                WidgetsBinding.instance
                    .addPostFrameCallback((timeStamp) async {
                  List<String>location=await Navigator.pushNamed(
                    context, '/archives',
                  ) as List<String>;
                });
              },
              child: const Text(
                'Archives',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],),
      ],
    );
  }
}
