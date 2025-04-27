import 'package:flutter/material.dart';
import 'package:swapgo/core/common/app_button.dart';
import 'package:swapgo/core/common/app_colors.dart';
import 'package:swapgo/core/common/app_fontStyles.dart';

// Create a model for musician (simple one)
class SkillCard {
  final String name;
  final String role;
  final int rating;
  final String experience;
  final String likes;
  final String energy;
  final String comments;
  final String imageUrl;

  SkillCard({
    required this.name,
    required this.role,
    required this.rating,
    required this.experience,
    required this.likes,
    required this.energy,
    required this.comments,
    required this.imageUrl,
  });
}

class SendTab extends StatelessWidget {
  final List<SkillCard> musicians;

  const SendTab({super.key, required this.musicians});

  @override
  Widget build(BuildContext context) {
    if (musicians.isEmpty) {
      return const Center(child: Text('No musicians found'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: musicians.length,
      itemBuilder: (context, index) {
        final musician = musicians[index];
        return Column(
          children: [_buildMusicianCard(musician), const SizedBox(height: 16)],
        );
      },
    );
  }

  Widget _buildMusicianCard(SkillCard skills) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.bottomNavbarContainerColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              skills.imageUrl,
              width: 105,
              height: 85,
              fit: BoxFit.cover,
              errorBuilder:
                  (context, error, stackTrace) => Container(
                    width: 105,
                    height: 85,
                    color: Colors.grey[300],
                    child: const Icon(Icons.person, size: 40),
                  ),
            ),
          ),
          const SizedBox(width: 15),

          // Musician Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name and Bookmark
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(skills.name, style: AppTextStyle.font16Medium()),
                    const Icon(Icons.bookmark_border),
                  ],
                ),
                const SizedBox(height: 3),

                // Role and Rating
                Row(
                  children: [
                    Text(skills.role, style: AppTextStyle.font13Regular()),
                    const SizedBox(width: 3),
                    ...List.generate(
                      5,
                      (index) => Icon(
                        Icons.star,
                        size: 14,
                        color:
                            index < skills.rating
                                ? AppColors.starcolor
                                : Colors.grey,
                      ),
                    ),
                  ],
                ),

                // Experience
                Text(
                  "Experience = ${skills.experience}",
                  style: AppTextStyle.font12Medium(),
                ),

                // Stats
                Row(
                  children: [
                    _buildStat(Icons.favorite, skills.likes),
                    const SizedBox(width: 12),
                    _buildStat(Icons.flash_on, skills.energy),
                    const SizedBox(width: 12),
                    _buildStat(Icons.chat_bubble_outline, skills.comments),
                  ],
                ),

                const SizedBox(height: 20),

                // UNSWAP Button
                AppButton(
                  text: 'UNSWAP',
                  backgroundColor: AppColors.greenColor,
                  verticalPadding: 10,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStat(IconData icon, String value) {
    return Row(
      children: [
        Icon(icon, size: 14, color: Colors.black54),
        const SizedBox(width: 4),
        Text(value, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
