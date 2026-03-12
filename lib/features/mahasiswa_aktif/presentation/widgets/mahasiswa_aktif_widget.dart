import 'package:flutter/material.dart';
import 'package:hello_flutter/features/mahasiswa_aktif/data/models/mahasiswa_aktif_model.dart';

class ModernMahasiswaAktifCard extends StatefulWidget {
  final MahasiswaAktifModel mahasiswa;
  final VoidCallback? onTap;
  final List<Color>? gradientColors;

  const ModernMahasiswaAktifCard({
    Key? key,
    required this.mahasiswa,
    this.onTap,
    this.gradientColors,
  }) : super(key: key);

  @override
  State<ModernMahasiswaAktifCard> createState() => _ModernMahasiswaAktifCardState();
}

class _ModernMahasiswaAktifCardState extends State<ModernMahasiswaAktifCard>
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
                      widget.mahasiswa.nama.substring(0, 1).toUpperCase(),
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
                        widget.mahasiswa.nama,
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
                        Icons.badge_outlined,
                        'NIM: ${widget.mahasiswa.nim}',
                      ),

                      const SizedBox(height: 4),

                      _buildInfoRow(
                        Icons.email_outlined,
                        widget.mahasiswa.email,
                      ),

                      const SizedBox(height: 4),

                      _buildInfoRow(
                        Icons.school_outlined,
                        widget.mahasiswa.jurusan,
                      ),

                      const SizedBox(height: 4),

                      _buildInfoRow(
                        Icons.schedule_outlined,
                        'Semester ${widget.mahasiswa.semester}',
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

class MahasiswaAktifListView extends StatelessWidget {
  final List<MahasiswaAktifModel> mahasiswaList;
  final VoidCallback? onRefresh;
  final bool useModernCard;

  const MahasiswaAktifListView({
    super.key,
    required this.mahasiswaList,
    this.onRefresh,
    this.useModernCard = true,
  });

  @override
  Widget build(BuildContext context) {
    if (mahasiswaList.isEmpty) {
      return const Center(
        child: Text("Data mahasiswa aktif kosong"),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        onRefresh?.call();
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: mahasiswaList.length,
        itemBuilder: (context, index) {
          final mahasiswa = mahasiswaList[index];

          /// Jika pakai modern card
          if (useModernCard) {
            return ModernMahasiswaAktifCard(
              mahasiswa: mahasiswa,
              onTap: () {
                debugPrint("Clicked ${mahasiswa.nama}");
              },
            );
          }

          /// Jika pakai simple card
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(
                  mahasiswa.nama.substring(0, 1).toUpperCase(),
                ),
              ),
              title: Text(mahasiswa.nama),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("NIM: ${mahasiswa.nim}"),
                  Text(mahasiswa.email),
                  Text(mahasiswa.jurusan),
                  Text("Semester ${mahasiswa.semester}"),
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
