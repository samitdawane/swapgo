import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapgo/controllers/user_controller.dart';
import 'package:swapgo/core/common/app_button.dart';
import 'package:swapgo/core/common/app_colors.dart';
import 'package:swapgo/core/common/app_fontStyles.dart';
import 'package:swapgo/core/common/custom_appbar.dart';
import 'package:swapgo/core/controllers/main_screen_controller.dart';
import 'package:swapgo/data/models/master_json_data.dart';
import 'package:swapgo/modules/navbar_tabs/profile_screen.dart';
import 'package:swapgo/modules/navbar_tabs/swap_screen.dart';

class ProfessionSearchScreen extends StatefulWidget {
  const ProfessionSearchScreen({super.key});

  @override
  State<ProfessionSearchScreen> createState() => _ProfessionSearchScreenState();
}

class _ProfessionSearchScreenState extends State<ProfessionSearchScreen> {
  final UserController userController = Get.find<UserController>();

  final TextEditingController _searchController = TextEditingController();
  final MainScreenController mainController = Get.find<MainScreenController>();

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
                    'skillsOwned':
                        userData.data?.personaldetails?.first.skillowned,
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
      appBar: CustomAppBar(title: "Profession Search"),
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
                        return InkWell(
                          onTap: () {
                            Get.to(
                              () => ProfileScreen(),
                              arguments: user['id'],
                            );
                          },
                          child: Container(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          const Icon(
                                            Icons.swap_horiz,
                                            size: 18,
                                          ),
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
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                String? selectedOption;
                                                String? selectedSkill;
                                                DateTime? selectedDateTime;

                                                List<String> userSkills = [];
                                                if (user["skillsOwned"] !=
                                                        null &&
                                                    user['skillsOwned']
                                                        .isNotEmpty) {
                                                  // Split skillsOwned by comma
                                                  userSkills =
                                                      user['skillsOwned']
                                                          .toString()
                                                          .split(',');
                                                  print(
                                                    "User Skills: $userSkills",
                                                  ); // Output: [Contract Drafting, Corporate Law, Arbitration]
                                                }
                                                return StatefulBuilder(
                                                  builder: (context, setState) {
                                                    Future<void>
                                                    _selectDateTime() async {
                                                      DateTime? pickedDate =
                                                          await showDatePicker(
                                                            context: context,
                                                            initialDate:
                                                                DateTime.now(),
                                                            firstDate:
                                                                DateTime.now(),
                                                            lastDate: DateTime(
                                                              2100,
                                                            ),
                                                          );

                                                      if (pickedDate != null) {
                                                        TimeOfDay? pickedTime =
                                                            await showTimePicker(
                                                              context: context,
                                                              initialTime:
                                                                  TimeOfDay.now(),
                                                            );

                                                        if (pickedTime !=
                                                            null) {
                                                          setState(() {
                                                            selectedDateTime =
                                                                DateTime(
                                                                  pickedDate
                                                                      .year,
                                                                  pickedDate
                                                                      .month,
                                                                  pickedDate
                                                                      .day,
                                                                  pickedTime
                                                                      .hour,
                                                                  pickedTime
                                                                      .minute,
                                                                );
                                                          });
                                                        }
                                                      }
                                                    }

                                                    return AlertDialog(
                                                      backgroundColor:
                                                          AppColors
                                                              .backgroundColor,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              20,
                                                            ),
                                                      ),
                                                      title: const Text(
                                                        'Swap By',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20,
                                                        ),
                                                      ),
                                                      content: SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .monetization_on,
                                                                  size: 18,
                                                                  color:
                                                                      Colors
                                                                          .orange,
                                                                ),
                                                                const SizedBox(
                                                                  width: 4,
                                                                ),
                                                                Text(
                                                                  'Balance: 50', // 👈 Put actual user's coin balance here dynamically
                                                                  style: const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            // Radio buttons
                                                            ListTile(
                                                              title: const Text(
                                                                'Knowledge Transfer',
                                                              ),
                                                              leading: Radio<
                                                                String
                                                              >(
                                                                value:
                                                                    'Knowledge Transfer',
                                                                groupValue:
                                                                    selectedOption,
                                                                onChanged: (
                                                                  value,
                                                                ) {
                                                                  setState(() {
                                                                    selectedOption =
                                                                        value;
                                                                  });
                                                                },
                                                              ),
                                                            ),
                                                            ListTile(
                                                              title: const Text(
                                                                'Spend Coins',
                                                              ),
                                                              leading: Radio<
                                                                String
                                                              >(
                                                                value:
                                                                    'Spend Coins',
                                                                groupValue:
                                                                    selectedOption,
                                                                onChanged: (
                                                                  value,
                                                                ) {
                                                                  setState(() {
                                                                    selectedOption =
                                                                        value;
                                                                  });
                                                                },
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),

                                                            // Skill Dropdown
                                                            if (selectedOption ==
                                                                'Knowledge Transfer') ...[
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                              DropdownButtonFormField<
                                                                String
                                                              >(
                                                                decoration: const InputDecoration(
                                                                  labelText:
                                                                      'Select Skill',
                                                                  border:
                                                                      OutlineInputBorder(),
                                                                ),
                                                                value:
                                                                    selectedSkill,
                                                                items:
                                                                    userSkills.map((
                                                                      skill,
                                                                    ) {
                                                                      return DropdownMenuItem(
                                                                        value:
                                                                            skill,
                                                                        child: Text(
                                                                          skill,
                                                                        ),
                                                                      );
                                                                    }).toList(),
                                                                onChanged: (
                                                                  value,
                                                                ) {
                                                                  setState(() {
                                                                    selectedSkill =
                                                                        value;
                                                                  });
                                                                },
                                                              ),
                                                            ],

                                                            const SizedBox(
                                                              height: 15,
                                                            ),
                                                            AppButton(
                                                              text:
                                                                  selectedDateTime ==
                                                                          null
                                                                      ? 'Select Date & Time'
                                                                      : 'Selected: ${selectedDateTime.toString()}',
                                                              onPressed: () {
                                                                _selectDateTime();
                                                              },
                                                            ),

                                                            // Date & Time picker button
                                                            const SizedBox(
                                                              height: 20,
                                                            ),

                                                            // Send Request button
                                                            if ((selectedOption ==
                                                                        'Spend Coins' &&
                                                                    selectedDateTime !=
                                                                        null) ||
                                                                (selectedOption ==
                                                                        'Knowledge Transfer' &&
                                                                    selectedDateTime !=
                                                                        null &&
                                                                    selectedSkill !=
                                                                        null))
                                                              SizedBox(
                                                                width:
                                                                    double
                                                                        .infinity,
                                                                child: ElevatedButton(
                                                                  onPressed: () {
                                                                    List<
                                                                      Transferdetails
                                                                    >
                                                                    transferdetails = [
                                                                      Transferdetails(
                                                                        requestaccaptance:
                                                                            "1",
                                                                        coinsspent:
                                                                            "1",
                                                                        isuser1xfer:
                                                                            "1",
                                                                        isuser2xfer:
                                                                            "1",
                                                                        usertype:
                                                                            "Sender",
                                                                        swaptype:
                                                                            selectedOption ==
                                                                                    "Knowledge Transfer"
                                                                                ? "1"
                                                                                : "2",
                                                                        swapbuddyid:
                                                                            user['id'].toString(),
                                                                        schaduledate:
                                                                            selectedDateTime?.toIso8601String(),
                                                                      ),
                                                                      Transferdetails(
                                                                        requestaccaptance:
                                                                            "1",
                                                                        coinsspent:
                                                                            "1",
                                                                        isuser1xfer:
                                                                            "1",
                                                                        isuser2xfer:
                                                                            "1",
                                                                        usertype:
                                                                            "Receiver",
                                                                        swaptype:
                                                                            selectedOption ==
                                                                                    "Knowledge Transfer"
                                                                                ? "1"
                                                                                : "2",
                                                                        swapbuddyid:
                                                                            "6",
                                                                        schaduledate:
                                                                            selectedDateTime?.toIso8601String(),
                                                                      ),
                                                                    ];
                                                                    userController.createMasterDataToSave(
                                                                      transferdetails,
                                                                      user['id'],
                                                                    );
                                                                    Navigator.pop(
                                                                      context,
                                                                    );
                                                                    // Pass the data to next screen if you want
                                                                    Get.to(
                                                                      () =>
                                                                          SwapScreen(),
                                                                      //     ProfileScreen(),
                                                                      // arguments: {
                                                                      //   'userId':
                                                                      //       user['id'],
                                                                      //   'option':
                                                                      //       selectedOption,
                                                                      //   'skill':
                                                                      //       selectedSkill,
                                                                      //   'dateTime':
                                                                      //       selectedDateTime.toString(),
                                                                      // },
                                                                    );
                                                                  },
                                                                  style: ElevatedButton.styleFrom(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .blue,
                                                                    padding:
                                                                        const EdgeInsets.symmetric(
                                                                          vertical:
                                                                              12,
                                                                        ),
                                                                    shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                            12,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  child: const Text(
                                                                    'Send Request',
                                                                    style: TextStyle(
                                                                      color:
                                                                          Colors
                                                                              .white,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
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
