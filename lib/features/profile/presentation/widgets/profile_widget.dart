import 'package:flutter/material.dart';
import 'package:hello_flutter/features/profile/data/models/profile_model.dart';

class ModernProfileCard extends StatefulWidget {
  final ProfileModel profile;
  final VoidCallback? onTap;
  final List<Color>? gradientColors;

  const ModernProfileCard({
    Key? key,
    required this.profile,
    this.onTap,
    this.gradientColors,
  }) : super(key: key);

  @override
  State<ModernProfileCard> createState() => _ModernProfileCardState();
}

class _ModernProfileCardState extends State<ModernProfileCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.97,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gradientColors = widget.gradientColors ??
        [
          Theme.of(context).primaryColor,
          Theme.of(context).primaryColor.withOpacity(0.7),
        ];

    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) {
        _controller.reverse();
        widget.onTap?.call();
      },
      onTapCancel: () => _controller.reverse(),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white, gradientColors[0].withOpacity(0.05)],
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: gradientColors[0].withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
            border: Border.all(
              color: gradientColors[0].withOpacity(0.1),
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                /// Avatar
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: gradientColors,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: gradientColors[0].withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      widget.profile.nama.substring(0, 1).toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 16),

                /// Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.profile.nama,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.3,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const SizedBox(height: 8),

                      _buildInfoRow(
                        Icons.email_outlined,
                        widget.profile.email,
                      ),

                      const SizedBox(height: 4),

                      _buildInfoRow(
                        Icons.phone_outlined,
                        widget.profile.noHp,
                      ),

                      const SizedBox(height: 4),

                      _buildInfoRow(
                        Icons.home_outlined,
                        widget.profile.alamat,
                      ),
                    ],
                  ),
                ),

                /// Arrow
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: gradientColors[0].withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                    color: gradientColors[0],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 14, color: Colors.grey[600]),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[700],
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class ProfileListView extends StatelessWidget {
  final List<ProfileModel> profileList;
  final VoidCallback? onRefresh;
  final bool useModernCard;

  const ProfileListView({
    super.key,
    required this.profileList,
    this.onRefresh,
    this.useModernCard = true,
  });

  @override
  Widget build(BuildContext context) {
    if (profileList.isEmpty) {
      return const Center(
        child: Text("Data profile kosong"),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        onRefresh?.call();
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: profileList.length,
        itemBuilder: (context, index) {
          final profile = profileList[index];

          /// Jika pakai modern card
          if (useModernCard) {
            return ModernProfileCard(
              profile: profile,
              onTap: () {
                debugPrint("Clicked ${profile.nama}");
              },
            );
          }

          /// Jika pakai simple card
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(
                  profile.nama.substring(0, 1).toUpperCase(),
                ),
              ),
              title: Text(profile.nama),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(profile.email),
                  Text(profile.noHp),
                  Text(profile.alamat),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          );
        },
      ),
    );
  }
}