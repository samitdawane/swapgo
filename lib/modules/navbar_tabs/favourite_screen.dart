import 'package:flutter/material.dart';
import 'package:swapgo/core/common/app_colors.dart';
import 'package:swapgo/core/common/app_images.dart';
import 'package:swapgo/core/common/coming_soon_screen.dart';
import 'package:swapgo/core/common/custom_appbar.dart';
import 'package:swapgo/modules/navbar_tabs/received_tab_screen.dart';
import 'package:swapgo/modules/navbar_tabs/send_tab_screen.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const CustomAppBar(title: "FAVOURITES"),

      body: ReceivedTab(skills: dummyReceivedSkills, isFav: true),
    );
  }
}

final List<SkillCard> dummyReceivedSkills = [
  SkillCard(
    name: "Robert Diaz",
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
  SkillCard(
    name: "Shantanu Joshi",
    role: "Dot Net Developer",
    rating: 4,
    experience: "4 years+",
    likes: "2K+",
    energy: "60+",
    comments: "128",
    imageUrl: AppImages.avatar5,
  ),
];
