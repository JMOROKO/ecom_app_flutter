# ecom_app_flutter

1. Changer le logo de l'application
    - Il faut placer l'icon dans le dossier `assets/icon`
    - Installation du package flutter_launcher_icons
      - flutter pub add flutter_launcher_icons
    - configuration de l'icon dans le fichier pubspec.yaml
        ```yaml
          flutter_launcher_icons:
            android: "launcher_icon"
            ios: true
            image_path: "assets/icon/icon.png"
            min_sdk_android: 21 # Android SDK minimal
            web:
              generate: true
            windows:
              generate: true
            macos:
              generate: true
        ```
    - Exécuter la commande suivante pour générer l'icon
      ```bash
      flutter pub run flutter_launcher_icons
      ```
   Cela aura pour effet de changer l'icon de l'application sur toutes les plateformes (Android, iOS, Web, Windows, MacOS).
2. Changer le splash de l'application