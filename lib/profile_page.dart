import 'package:bitirmeprojesi/update_profile.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map<String, String> profileData = {
    'name': '',
    'surname': '',
    'age': '',
    'height': '',
    'weight': '',
    'position': '',
    'foot': '',
    'contact': '',
    'city': '',
    'team': '',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      'https://www.pngall.com/wp-content/uploads/5/Profile-Male-PNG.png',
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildInfoRow('Ad', profileData['name']!),
                  _buildInfoRow('Soyad', profileData['surname']!),
                  _buildInfoRow('Yaş', profileData['age']!),
                  _buildInfoRow('Boy', profileData['height']!),
                  _buildInfoRow('Kilo', profileData['weight']!),
                  _buildInfoRow('Pozisyon', profileData['position']!),
                  _buildInfoRow('Güçlü Ayak', profileData['foot']!),
                  _buildInfoRow('İletişim', profileData['contact']!),
                  _buildInfoRow('Şehir', profileData['city']!),
                  _buildInfoRow('Tuttuğu Takım', profileData['team']!),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Image.network(
              'https://galeri14.uludagsozluk.com/805/en-iyi-hali-saha-taktikleri_1643717.jpg',
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateProfileScreen(
                      profileData: profileData,
                      onUpdate: (updatedProfileData) {
                        setState(() {
                          profileData = updatedProfileData;
                        });
                      },
                    ),
                  ),
                );
              },
              child: const Text('Profili Düzenle'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label + ':',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
