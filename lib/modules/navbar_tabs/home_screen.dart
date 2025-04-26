import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapgo/core/common/app_colors.dart';
import 'package:swapgo/core/common/app_fontStyles.dart';
import 'package:swapgo/core/common/app_images.dart';
import 'package:swapgo/core/common/coming_soon_screen.dart';
import 'package:swapgo/core/common/custom_appbar.dart';
import 'package:swapgo/modules/profession/profession_search.dart';
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
      appBar: CustomAppBar(
        title: "HOME",
        onSearchTap: () {
          Get.to(() => const ProfessionSearchScreen());
        },
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Swap, learn, grow
              Text("Swap, learn, grow", style: AppTextStyle.font26Bold()),
              const SizedBox(height: 20),

              // Most collaborated (Horizontal List)
              SizedBox(
                height: 180,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.bottomNavbarContainerColor,
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
                              const Spacer(),
                              CircleAvatar(
                                radius: 10,
                                // backgroundColor: Colors.grey,
                                child: Image.asset(AppImages.avatar1),
                              ),
                              const SizedBox(width: 4),
                              CircleAvatar(
                                radius: 10,
                                // backgroundColor: Colors.grey,
                                child: Image.asset(AppImages.avatar2),
                              ),
                              const SizedBox(width: 4),
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.grey,
                                child: Image.asset(AppImages.avatar5),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "+100",
                                style: AppTextStyle.font12Regular(
                                  fontFamily: AppFontFamily.inter,
                                ).copyWith(fontSize: 6),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Discover the most accomplished and influential professionals",
                            style: AppTextStyle.font13Medium(),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              const Icon(Icons.favorite_border, size: 18),
                              Text(
                                "100",
                                style: AppTextStyle.font13Medium(
                                  fontFamily: AppFontFamily.inter,
                                ),
                              ),
                              const SizedBox(width: 6),
                              const Icon(Icons.swap_horiz, size: 18),
                              Text(
                                "100",
                                style: AppTextStyle.font13Medium(
                                  fontFamily: AppFontFamily.inter,
                                ),
                              ),
                              const SizedBox(width: 6),
                              const Icon(Icons.comment_outlined, size: 18),
                              Text(
                                "100",
                                style: AppTextStyle.font13Medium(
                                  fontFamily: AppFontFamily.inter,
                                ),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  Get.to(() => const ComingSoonScreen());
                                },
                                child: Text(
                                  "See more",
                                  style: AppTextStyle.font13SemiBold(
                                    fontFamily: AppFontFamily.inter,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 30),

              // Free Learning Title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Free Learning", style: AppTextStyle.font20Bold()),
                  InkWell(
                    onTap: () {
                      Get.to(() => const ComingSoonScreen());
                    },
                    child: Text("See more", style: AppTextStyle.font13Medium()),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Free Learning (Horizontal List)
              SizedBox(
                height: 270,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    return Container(
                      width: 280,
                      decoration: BoxDecoration(
                        color: AppColors.textFieldColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                            child: Container(
                              color: AppColors.bottomNavbarContainerColor,
                              child: Image.asset(
                                AppImages.uiUxBanner, // Your image
                                height: 120,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
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
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
