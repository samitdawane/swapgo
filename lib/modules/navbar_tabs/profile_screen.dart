import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapgo/controllers/user_controller.dart';
import 'package:swapgo/core/common/app_colors.dart';
import 'package:swapgo/core/common/custom_appbar.dart';
import 'package:swapgo/data/models/master_json_data.dart';
import 'package:swapgo/modules/profession/profession_search.dart';

class ProfileScreen extends StatelessWidget {
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    final int userId = Get.arguments;
    final MasterJSONData? userData = userController.masterDataJSON
        .firstWhereOrNull((user) => user.data?.id == userId);

    if (userData == null) {
      return Scaffold(
        appBar: AppBar(title: Text("Profile")),
        body: Center(child: Text('User not found')),
      );
    }

    final data = userData.data!;

    return Scaffold(
      appBar: CustomAppBar(
        title: "Profile",
        onSearchTap: () {
          Get.to(() => const ProfessionSearchScreen());
        },
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/profile_avatar/${data.avatarwithinterest?.first.imgLink}',
                        width: 105,
                        height: 85,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(height: 12),
                    Text(
                      '${data.fname ?? ''} ${data.lname ?? ''}',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.favorite_border, size: 18),
                        Text('3K+'),
                        const SizedBox(width: 8),

                        Icon(Icons.brightness_1, size: 6),
                        const SizedBox(width: 8),
                        const Icon(Icons.swap_horiz, size: 18),
                        const SizedBox(width: 8),
                        Text('60+'),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _button("SWAP", Colors.brown, Colors.white),
                        const SizedBox(width: 8),
                        _button("MESSAGE", Colors.grey[300]!, Colors.black),
                      ],
                    ),
                    const SizedBox(height: 24),
                    _sectionTitle("About"),
                    _aboutRow(Icons.phone, data.mobileNo ?? ''),
                    _aboutRow(Icons.message, data.email ?? ''),
                    _aboutRow(
                      Icons.link,
                      'https://www.linkedin.com/feed/${data.fname}',
                    ),
                    const SizedBox(height: 24),
                    _sectionTitle("Discription"),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        data.personaldetails?.first.description ??
                            'No description available',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    const SizedBox(height: 24),
                    _sectionTitle("Achievements"),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _bulletText(
                            'Released two successful albums that garnered positive reviews and substantial airplay',
                          ),
                          _bulletText(
                            'Awarded "Best Original Soundtrack" at the XYZ Film Festival for my composition in the film "Dreamscape"',
                          ),
                          _bulletText(
                            'Collaborated with renowned artists and musicians, broadening my musical horizons',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _button(String text, Color color, Color textColor) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Text(text, style: TextStyle(color: textColor)),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 4),
          Icon(Icons.info_outline, size: 16),
        ],
      ),
    );
  }

  Widget _aboutRow(IconData icon, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 18),
          const SizedBox(width: 8),
          Expanded(child: Text(value, style: TextStyle(fontSize: 14))),
        ],
      ),
    );
  }

  Widget _bulletText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("• ", style: TextStyle(fontSize: 16)),
          Expanded(child: Text(text, style: TextStyle(fontSize: 14))),
        ],
      ),
    );
  }

  Widget _buildStat(IconData icon, String value) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.black54),
        const SizedBox(width: 10),
        Text(value, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
