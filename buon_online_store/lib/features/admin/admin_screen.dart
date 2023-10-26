import 'package:buon_online_store/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      backgroundColor: const Color(0xfff6f6f6),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          child: ListView(
            children: [
              _SingleSection(
                title: "Shop Management",
                children: [
                  _CustomListTile(
                    title: "Add Products",
                    icon: FontAwesomeIcons.squarePlus,
                    onTap: () => navigateToAddProductForm(context),
                  ),
                  _CustomListTile(
                    title: "Products Management",
                    icon: CupertinoIcons.cloud_download,
                    onTap: () => navigateToProductsManagementScreen(context),
                  ),
                  _CustomListTile(
                    title: "Security Status",
                    icon: CupertinoIcons.lock_shield,
                    onTap: () {},
                  ),
                ],
              ),
              _SingleSection(
                title: "Network",
                children: [
                  _CustomListTile(
                    title: "SIM Cards and Networks",
                    icon: Icons.sd_card_outlined,
                    onTap: () {},
                  ),
                  _CustomListTile(
                    title: "Wi-Fi",
                    icon: CupertinoIcons.wifi,
                    trailing: CupertinoSwitch(value: true, onChanged: (val) {}),
                    onTap: () {},
                  ),
                  _CustomListTile(
                    title: "Bluetooth",
                    icon: CupertinoIcons.bluetooth,
                    trailing:
                        CupertinoSwitch(value: false, onChanged: (val) {}),
                    onTap: () {},
                  ),
                  _CustomListTile(
                    title: "VPN",
                    icon: CupertinoIcons.desktopcomputer,
                    onTap: () {},
                  )
                ],
              ),
              _SingleSection(
                title: "Privacy and Security",
                children: [
                  _CustomListTile(
                    title: "Multiple Users",
                    icon: CupertinoIcons.person_2,
                    onTap: () {},
                  ),
                  _CustomListTile(
                    title: "Lock Screen",
                    icon: CupertinoIcons.lock,
                    onTap: () {},
                  ),
                  _CustomListTile(
                    title: "Display",
                    icon: CupertinoIcons.brightness,
                    onTap: () {},
                  ),
                  _CustomListTile(
                    title: "Sound and Vibration",
                    icon: CupertinoIcons.speaker_2,
                    onTap: () {},
                  ),
                  _CustomListTile(
                    title: "Themes",
                    icon: CupertinoIcons.paintbrush,
                    onTap: () {},
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final Widget? trailing;
  const _CustomListTile(
      {Key? key,
      required this.title,
      required this.icon,
      this.trailing,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      trailing: trailing ?? const Icon(CupertinoIcons.forward, size: 18),
      onTap: onTap,
    );
  }
}

class _SingleSection extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const _SingleSection({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(fontSize: 16),
          ),
        ),
        Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }
}
