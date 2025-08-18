import 'package:flutter/material.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFFFADCD6),
        child: Column(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            ListTile(
              title: Text(
                'Home',
                style: TextStyle(fontSize: 16, color: Color(0xFFD36C5B)),
              ),
              trailing: _selectedIndex == 0
                  ? null
                  : Icon(Icons.arrow_forward_ios, color: Color(0xFFD36C5B)),
              onTap: () {
                setState(() {
                  _selectedIndex = 0;
                });
              },
            ),
            ListTile(
              title: Text(
                'shop',
                style: TextStyle(fontSize: 16, color: Color(0xFFD36C5B)),
              ),
              trailing: _selectedIndex == 1
                  ? null
                  : Icon(Icons.arrow_forward_ios, color: Color(0xFFD36C5B)),
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                });
              },
            ),
            ListTile(
              title: Text(
                'Customize it',
                style: TextStyle(fontSize: 16, color: Color(0xFFD36C5B)),
              ),
              trailing: _selectedIndex == 2
                  ? null
                  : Icon(Icons.arrow_forward_ios, color: Color(0xFFD36C5B)),
              onTap: () {
                setState(() {
                  _selectedIndex = 2;
                });
              },
            ),
            const Spacer(),
            ListTile(
              leading: Icon(Icons.person_2_outlined, color: Color(0xFFD36C5B)),
              title: Text(
                'Log in',
                style: TextStyle(fontSize: 16, color: Color(0xFFD36C5B)),
              ),
              onTap: () {},
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
