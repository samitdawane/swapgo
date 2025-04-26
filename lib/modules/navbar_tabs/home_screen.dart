import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapgo/core/common/app_colors.dart';
import 'package:swapgo/core/common/app_fontStyles.dart';
import 'package:swapgo/core/common/custom_appbar.dart';
// import navbar

class HomeScreen extends StatefulWidget {
  final Map<String, dynamic>? arguements;
  const HomeScreen({super.key, this.arguements});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        onSearchTap: () {
          // Get.to(() => const ProfessionSearchScreen());
        },
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top icons (search and crown)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.search, size: 28),
                  const SizedBox(width: 16),
                  Icon(Icons.emoji_events_outlined, size: 28),
                ],
              ),
              const SizedBox(height: 20),

              // Swap, learn, grow
              Text("Swap, learn, grow", style: AppTextStyle.font26Bold()),
              const SizedBox(height: 20),

              // Most collaborated card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.yellow[700],
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Most Collaborated",
                          style: AppTextStyle.font14Bold(),
                        ),
                        Spacer(),
                        CircleAvatar(radius: 10, backgroundColor: Colors.grey),
                        SizedBox(width: 4),
                        CircleAvatar(radius: 10, backgroundColor: Colors.grey),
                        SizedBox(width: 4),
                        CircleAvatar(radius: 10, backgroundColor: Colors.grey),
                        SizedBox(width: 4),
                        Text("+100"),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Discover the most accomplished and influential professionals",
                      style: AppTextStyle.font13Medium(),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.favorite_border, size: 18),
                        SizedBox(width: 6),
                        Icon(Icons.swap_horiz, size: 18),
                        SizedBox(width: 6),
                        Icon(Icons.comment_outlined, size: 18),
                        Spacer(),
                        Text("See more", style: AppTextStyle.font13Medium()),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Free Learning title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Free Learning", style: AppTextStyle.font20Bold()),
                  Text("See more", style: AppTextStyle.font13Medium()),
                ],
              ),
              const SizedBox(height: 20),

              // Learning Card
              Container(
                decoration: BoxDecoration(
                  color: AppColors.textFieldColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                      child: Image.asset(
                        "assets/images/ux_design_course.png", // 👈 Replace with your image
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "21,390 students · 10h 26m",
                            style: AppTextStyle.font12Medium(),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            "Learn UI/UX Design, Figma and Prototyping",
                            style: AppTextStyle.font14Bold(),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            "- Brad Frost",
                            style: AppTextStyle.font12Medium(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
