# ecom_app_flutter

1. Changer le logo de l'application
    - Il faut placer l'icon dans le dossier 
      ```yaml
         assets:
            - assets/logo/
            - assets/icon/
      ```
    - Installation du package flutter_launcher_icons
      ```bash
         flutter pub add flutter_launcher_icons
      ```
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
      Cela aura pour effet de changer l'icon de l'application sur toutes les plateformes (Android, iOS, Web, Windows, MacOS). <br/>
      <img src="readme/1.jpg" alt="icon" /> <br>
2. Changer le splash de l'application
   - Installation de la dependance
     - flutter pub add flutter_native_splash
   - Création du fichier de configuration à la racine du projet flutter_native_splash.yaml
   - Récupération de toutes les images contenue dans le fichier asset en modifiant le fichier pubspec.yaml
     ```yaml
      flutter:
        uses-material-design: true
        assets:
          - assets/logo/
          - assets/icon/
      ```
   - Execution de la commande pour générer les ressources
      ```bash
          dart run flutter_native_splash:create
      ```
      <br/><img src="readme/2.jpg" alt="icon splash" /> <br>
3. Mise en place du routage <br/>
Le routage se fait dans le point d'entrée de l'application (main.dart). <br/>
Il se fait comme suit :
```dart
  Widget build(BuildContext context) {
      return MaterialApp(
        //masquer la barre de debug
        debugShowCheckedModeBanner: false,
        // routage
        routes: {
          "/": (context) => HomePage(),
          "/customers": (context) => CustomerPage(),
          "/bills": (context) => BillsPage(),
          "/inventories": (context) => InventoriesPage(),
        },
      );
    }
```
4. Mise en place du Menu
    - Comment naviger entre les pages
   ```dart
      Navigator.pushNamed(context, "${route}");
   ```
    - Menu
      Pour mettre en place le menu il faut d'abord réaliser un draweritem qui servira au templace du menu
    ```dart
      Widget build(BuildContext context) {
            return ListTile(
              leading: itemIcon,
              trailing: Icon(Icons.arrow_forward),
              title: Text("${title}"),
              onTap: () {
                // fermer le menu drawer
                Navigator.of(context).pop();
                // naviguer vers la route
                Navigator.pushNamed(context, "${route}");
              },
            );
        }
    ```
    - Barre de navigation
      La barre de navigation se fait grace au menu drawer
    ```dart
      Widget build(BuildContext context) {
        return Drawer(
          child: Column(
            children: [
    
              //mise en place du menu
              DrawerItem(
                  title: "Accueil",
                  itemIcon: Icon(
                      Icons.home,
                      color: Theme.of(context).primaryColor,
                    ),
                  route: "/"
              ),
              Divider(
                height: 0.5,
                color: Theme.of(context).primaryColor,
              ),
              DrawerItem(
                  title: "Customer",
                  itemIcon: Icon(
                    Icons.verified_user,
                    color: Theme.of(context).primaryColor,
                  ),
                  route: "/customer"
              ),
              Divider(
                height: 0.5,
                color: Theme.of(context).primaryColor,
              ),
              DrawerItem(
                  title: "Bills",
                  itemIcon: Icon(
                    Icons.list_alt,
                    color: Theme.of(context).primaryColor,
                  ),
                  route: "/bills"
              ),
              Divider(
                height: 0.5,
                color: Theme.of(context).primaryColor,
              ),
              DrawerItem(
                  title: "Inventories",
                  itemIcon: Icon(
                    Icons.inventory,
                    color: Theme.of(context).primaryColor,
                  ),
                  route: "/inventories"
              ),
            ],
          ),
        );
    }
    ```
    - Entête header
        L'entête header se met en place grace au widget DrawerHeader
        ```dart
          return DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    // backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage("assets/logo/reactiv.png"),
                    radius: 60,
                  ),
                  Text("Menu application")
                ],
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Theme.of(context).primaryColor,
                  ],
                ),
              ),
           );
        ```
      - Utilisation de l'entête header
    ```dart
      Widget build(BuildContext context) {
        return Drawer(
          child: Column(
            children: [
              // appel de l'entete du menu
              EnteteMenuDrawerHeader(),
    
              //mise en place du menu
              DrawerItem(
                  title: "Accueil",
                  itemIcon: Icon(
                      Icons.home,
                      color: Theme.of(context).primaryColor,
                    ),
                  route: "/"
              ),
              Divider(
                height: 0.5,
                color: Theme.of(context).primaryColor,
              ),
              DrawerItem(
                  title: "Customer",
                  itemIcon: Icon(
                    Icons.verified_user,
                    color: Theme.of(context).primaryColor,
                  ),
                  route: "/customer"
              ),
              Divider(
                height: 0.5,
                color: Theme.of(context).primaryColor,
              ),
              DrawerItem(
                  title: "Bills",
                  itemIcon: Icon(
                    Icons.list_alt,
                    color: Theme.of(context).primaryColor,
                  ),
                  route: "/bills"
              ),
              Divider(
                height: 0.5,
                color: Theme.of(context).primaryColor,
              ),
              DrawerItem(
                  title: "Inventories",
                  itemIcon: Icon(
                    Icons.inventory,
                    color: Theme.of(context).primaryColor,
                  ),
                  route: "/inventories"
              ),
            ],
          ),
        );
    }
    ```
    
5. Création des pages
   - Page customer
     - Ajout d'un header
     ```dart
     appBar: AppBar(
        title: Text('Customer liste'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
     ```
     - Création de la class customer
     ```dart
      
       class Customer{
            final int id;
            final String name;
            final String email;
            
            Customer({required this.id, required this.name, required this.email});
            
            factory Customer.fromJson(Map<String, dynamic> json) {
            return Customer(
            id: json['id'] as int,
            name: json['name'] as String,
            email: json['email'] as String,
            );
            }
            
            Map<String, dynamic> toJson() {
            return {
            'id': id,
            'name': name,
            'email': email,
            };
          }
      }
     ```
     - Affichage de la liste des utilisateurs
     ```dart
     body:
      clients.length == 0 ?
          Center(
            child: Text("Veuillez d'abord ajouter un client."),
          ) :
      ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: clients.length ?? 0,
        itemBuilder: (context, index) {
          final client = clients[index];
          return
          Card(
            elevation: 2.0,
            margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor, //Colors.blue,
                child: Text(
                  client.name[0],
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: Text(
                client.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(client.email),
                ],
              ),
              onTap: () {
                // lors du clic je veux lancer un appel téléphonique au client
                // Action lors du clic sur un client
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Client: ${client.name}')),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action to perform when the button is pressed
        },
        child: Icon(Icons.add),
      ),
     ```
     - Consommation de l'API customer
       - Ajouter le package http dans le fichier pubspec.yaml
       ```bash
         dart pub add http
       ```
       - ensuite saisir la commande
       ```bash
         dart pub get
       ```
       - creation du service customer
     ```dart
      Future<List<Customer>> getAllCustomer() async{
         final uri = Uri.parse(baseURL + customerURL + customerListURL);
         final call = await get(uri);
         print('Status code: ${call.statusCode}');
         Map<String, dynamic> data = json.decode(call.body);
         List<dynamic> customersJson = data['_embedded']['customers'];
         List<Customer> customers = customersJson.map<Customer>( (json) => Customer.fromJson(json) ).toList();
         //print(customers);
         return customers;
      }
     ```
     - Modification de la page stateless en statefull
   - Page Inventories
   - Bills