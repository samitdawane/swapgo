import 'package:flutter/material.dart';
import 'package:swapgo/core/common/app_colors.dart';
import 'package:swapgo/data/models/user_model.dart';

class ProfessionSearchScreen extends StatefulWidget {
  const ProfessionSearchScreen({Key? key}) : super(key: key);

  @override
  State<ProfessionSearchScreen> createState() => _ProfessionSearchScreenState();
}

class _ProfessionSearchScreenState extends State<ProfessionSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = "";

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> get _filteredUsers {
    if (_searchText.isEmpty) return [];
    return UserData.professionUsers[_searchText.toLowerCase()] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        return Card(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                user['imageUrl'] ?? "",
                              ),
                              radius: 30,
                            ),
                            title: Text(
                              user['name'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 4),
                                Text("Experience: ${user['experience']}"),
                                Text("Likes: ${user['numberOfLikes']}"),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    StarRatingWidget(rating: user['rating']),
                                    const SizedBox(width: 8),
                                    Text("${user['rating']}"),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text("Liked: ${user['liked'] ? "Yes" : "No"}"),
                                const SizedBox(height: 4),
                                Text("Description: ${user['description']}"),
                                const SizedBox(height: 4),
                                InkWell(
                                  onTap: () {
                                    // Open LinkedIn URL
                                  },
                                  child: Text(
                                    "LinkedIn Profile",
                                    style: const TextStyle(
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            isThreeLine: true,
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
    Key? key,
    required this.rating,
    this.starCount = 5,
    this.filledStarColor = Colors.amber,
    this.unfilledStarColor = Colors.grey,
    this.size = 20.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> stars = [];

    for (int i = 0; i < starCount; i++) {
      if (i < rating.floor()) {
        stars.add(Icon(Icons.star, color: filledStarColor, size: size));
      } else if (i < rating) {
        stars.add(Icon(Icons.star_half, color: filledStarColor, size: size));
      } else {
        stars.add(
          Icon(Icons.star_border, color: unfilledStarColor, size: size),
        );
      }
    }

    return Row(mainAxisSize: MainAxisSize.min, children: stars);
  }
}
