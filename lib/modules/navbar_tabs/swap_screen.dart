import 'package:flutter/material.dart';
import 'package:swapgo/core/common/app_colors.dart';
import 'package:swapgo/core/common/app_fontStyles.dart';
import 'package:swapgo/core/common/app_images.dart';
import 'package:swapgo/core/common/custom_appbar.dart';
import 'package:swapgo/modules/navbar_tabs/received_tab_screen.dart';
import 'package:swapgo/modules/navbar_tabs/send_tab_screen.dart';

class SwapScreen extends StatefulWidget {
  const SwapScreen({super.key});

  @override
  State<SwapScreen> createState() => _SwapScreenState();
}

class _SwapScreenState extends State<SwapScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<SkillCard> dummySendSkills = [
    SkillCard(
      name: "Jacob Buckley",
      role: "UI/UX, Branding",
      rating: 5,
      experience: "1-3 years",
      likes: "3K+",
      energy: "65+",
      comments: "146",
      imageUrl: AppImages.avatar1,
    ),
    SkillCard(
      name: "Megan Huerta",
      role: "SQL, C#",
      rating: 4,
      experience: "1-3 years",
      likes: "5K+",
      energy: "60+",
      comments: "128",
      imageUrl: AppImages.avatar5,
    ),
  ];

  final List<SkillCard> dummyReceivedSkills = [
    SkillCard(
      name: "Gaurav Varadkar",
      role: "Flutter Developer",
      rating: 5,
      experience: "2 years+",
      likes: "3K+",
      energy: "65+",
      comments: "146",
      imageUrl: AppImages.avatar1,
    ),
    SkillCard(
      name: "Harsh Singh",
      role: "Dot Net Developer",
      rating: 4,
      experience: "4 years+",
      likes: "2K+",
      energy: "60+",
      comments: "128",
      imageUrl: AppImages.avatar5,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const CustomAppBar(title: "SWAP"),
      body: Column(
        children: [
          // Tab Bar
          TabBar(
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: AppColors.bottomNavbarColor,
            indicatorWeight: 5,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: const [Tab(text: "SEND"), Tab(text: "RECEIVED")],
            labelStyle: AppTextStyle.font16SemiBold(),
          ),

          // Musician List
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                SendTab(musicians: dummySendSkills),
                ReceivedTab(skills: dummyReceivedSkills),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
