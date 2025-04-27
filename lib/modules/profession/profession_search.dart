import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapgo/controllers/user_controller.dart';
import 'package:swapgo/core/common/app_button.dart';
import 'package:swapgo/core/common/app_colors.dart';
import 'package:swapgo/core/common/app_fontStyles.dart';
import 'package:swapgo/core/controllers/main_screen_controller.dart';
import 'package:swapgo/data/models/user_model.dart';
import 'package:swapgo/modules/navbar_tabs/profile_screen.dart';

class ProfessionSearchScreen extends StatefulWidget {
  const ProfessionSearchScreen({super.key});

  @override
  State<ProfessionSearchScreen> createState() => _ProfessionSearchScreenState();
}

class _ProfessionSearchScreenState extends State<ProfessionSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final MainScreenController mainController = Get.find<MainScreenController>();
  final UserController userController = Get.find<UserController>();

  String _searchText = "";

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> get _filteredUsers {
    if (_searchText.isEmpty) return [];

    return userController.masterDataJSON
        .expand(
          (userData) =>
              userData.data?.avatarwithinterest?.map((avatar) {
                if (avatar.interest!.toLowerCase().contains(
                  _searchText.toLowerCase(),
                )) {
                  return {
                    'ImgLink': avatar.imgLink ?? '',
                    'interest': avatar.interest ?? '',
                    'name':
                        '${userData.data?.fname ?? ''} ${userData.data?.lname ?? ''}',
                    'rating':
                        userData.data?.reviewandrating?.isNotEmpty == true
                            ? userData.data?.reviewandrating!.first.rating ?? ''
                            : '',
                    'description':
                        userData.data?.personaldetails?.isNotEmpty == true
                            ? userData
                                    .data
                                    ?.personaldetails!
                                    .first
                                    .description ??
                                ''
                            : '',
                    'experience':
                        userData.data?.personaldetails?.isNotEmpty == true
                            ? userData
                                    .data
                                    ?.personaldetails!
                                    .first
                                    .experience ??
                                ''
                            : '',
                    'numberOfLikes':
                        userData.data?.reviewandrating?.isNotEmpty == true
                            ? userData.data?.reviewandrating!.first.likes ?? ''
                            : '',
                    'numberOfComments':
                        userData.data?.reviewandrating?.isNotEmpty == true
                            ? userData.data?.reviewandrating!.first.comments ??
                                ''
                            : '',
                    'numberOfSwaps':
                        userData.data?.reviewandrating?.isNotEmpty == true
                            ? userData.data?.reviewandrating!.first.swap ?? ''
                            : '',
                    'id': userData.data?.id ?? '',
                  };
                } else {
                  return null;
                }
              }) ??
              [],
        )
        .where((element) => element != null) // filter out nulls
        .cast<Map<String, dynamic>>()
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(title: const Text('Search Users by Profession')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Enter profession (musician, engineer, doctor)",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchText = value.trim();
                });
              },
            ),
          ),
          Expanded(
            child:
                _filteredUsers.isEmpty
                    ? const Center(
                      child: Text("No users found. Please search correctly."),
                    )
                    : ListView.builder(
                      itemCount: _filteredUsers.length,
                      itemBuilder: (context, index) {
                        final user = _filteredUsers[index];
                        return Container(
                          padding: EdgeInsets.all(12),
                          margin: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.carColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          // elevation: 4,
                          // shape: RoundedRectangleBorder(
                          //   borderRadius: BorderRadius.circular(12),
                          // ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    'assets/profile_avatar/${user['ImgLink']}',

                                    width: 105,
                                    height: 85,
                                    fit: BoxFit.cover,
                                    // errorBuilder:
                                    //     (context, error, stackTrace) =>
                                    //         Container(
                                    //           width: 105,
                                    //           height: 85,
                                    //           color: Colors.grey[300],
                                    //           child: const Icon(
                                    //             Icons.person,
                                    //             size: 40,
                                    //           ),
                                    //         ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      user['name'],
                                      style: AppTextStyle.font17SemiBold(),
                                    ),
                                    // const SizedBox(height: 4),
                                    Text(
                                      user['interest'],
                                      style: AppTextStyle.font13Medium(),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      "Experience: ${user['experience']} years",
                                      style: AppTextStyle.font12Medium(),
                                    ),
                                    SizedBox(height: 6),
                                    Row(
                                      children: [
                                        // StarRatingWidget(rating: user['rating']),
                                        const Icon(
                                          Icons.favorite_border,
                                          size: 18,
                                        ),
                                        Text("${user['numberOfLikes']}"),
                                        const SizedBox(width: 8),
                                        const Icon(Icons.swap_horiz, size: 18),
                                        Text("${user['numberOfSwaps']}"),
                                        const SizedBox(width: 12),
                                        const Icon(
                                          Icons.comment_outlined,
                                          size: 18,
                                        ),
                                        Text("${user['numberOfComments']}"),
                                      ],
                                    ),
                                    SizedBox(height: 4),
                                    SizedBox(
                                      width: double.infinity,
                                      child: AppButton(
                                        text: 'SWAP',
                                        onPressed: () {
                                          Get.to(
                                            () => ProfileScreen(),
                                            arguments: user['id'],
                                          );
                                        },
                                        verticalPadding: 8,
                                      ),
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
    );
  }
}

class StarRatingWidget extends StatelessWidget {
  final double rating;
  final int starCount;
  final Color filledStarColor;
  final Color unfilledStarColor;
  final double size;

  const StarRatingWidget({
    super.key,
    required this.rating,
    this.starCount = 5,
    this.filledStarColor = Colors.amber,
    this.unfilledStarColor = Colors.grey,
    this.size = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> stars = [];

    for (int i = 0; i < starCount; i++) {
      if (i < rating.floor()) {
        stars.add(Icon(Icons.star, color: AppColors.starcolor, size: size));
      } else if (i < rating) {
        stars.add(
          Icon(Icons.star_half, color: AppColors.starcolor, size: size),
        );
      } else {
        stars.add(
          Icon(Icons.star_border, color: unfilledStarColor, size: size),
        );
      }
    }

    return Row(mainAxisSize: MainAxisSize.min, children: stars);
  }
}
