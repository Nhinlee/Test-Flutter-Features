const downloadURL =
    'https://storage.googleapis.com/stag-manabie-backend/user-upload/30MB.bin01GDYXD8E7EMHE541K19XC9T51.zip';

class DownloadItems {
  static const zipFiles = [
    DownloadItem(name: 'Zip 1.zip', url: downloadURL),
    DownloadItem(name: 'Zip 2', url: downloadURL),
    DownloadItem(name: 'Zip 3', url: downloadURL),
    DownloadItem(name: 'Zip 4', url: downloadURL),
    DownloadItem(name: 'Zip 5', url: downloadURL),
    DownloadItem(name: 'Zip 6', url: downloadURL),
    DownloadItem(name: 'Zip 7', url: downloadURL),
    DownloadItem(name: 'Zip 8', url: downloadURL),
    DownloadItem(name: 'Zip 9', url: downloadURL),
    DownloadItem(name: 'Zip 10', url: downloadURL),
  ];

  static const images = [
    DownloadItem(
      name: 'Arches National Park.jpg',
      url:
          'https://upload.wikimedia.org/wikipedia/commons/6/60/The_Organ_at_Arches_National_Park_Utah_Corrected.jpg',
    ),
    DownloadItem(
      name: 'Canyonlands National Park',
      url:
          'https://upload.wikimedia.org/wikipedia/commons/7/78/Canyonlands_National_Park%E2%80%A6Needles_area_%286294480744%29.jpg',
    ),
    DownloadItem(
      name: 'Death Valley National Park',
      url:
          'https://upload.wikimedia.org/wikipedia/commons/b/b2/Sand_Dunes_in_Death_Valley_National_Park.jpg',
    ),
    DownloadItem(
      name: 'Gates of the Arctic National Park and Preserve',
      url:
          'https://upload.wikimedia.org/wikipedia/commons/e/e4/GatesofArctic.jpg',
    ),
  ];

  static const apks = [
    DownloadItem(
      name: 'Spitfire',
      url:
          'https://github.com/bartekpacia/spitfire/releases/download/v1.2.0/spitfire.apk',
    )
  ];
}

class DownloadItem {
  const DownloadItem({required this.name, required this.url});

  final String name;
  final String url;
}
