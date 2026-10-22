# Flutter Food App UI

A two-screen food ordering UI built in Flutter in 2021 for layout practice. There's no backend; all menu data is hardcoded in `lib/constant.dart`.

<img width="200" alt="Home screen" src="https://user-images.githubusercontent.com/34390549/145694883-18050a24-8c2d-43b4-85d9-8ddb2a7ec5ee.png"> <img width="200" alt="Screenshot" src="https://user-images.githubusercontent.com/34390549/145694887-da2e16e2-55a1-4b9c-9eb6-d26e8d82dc99.png">
<img width="200" alt="Screenshot" src="https://user-images.githubusercontent.com/34390549/145694889-d2c4743a-3bf4-4f81-957b-1fd1a2242c4f.png">
<img width="200" alt="Food detail screen" src="https://user-images.githubusercontent.com/34390549/145694892-ff7eb950-f87c-4a66-a432-3161513d178b.png">
<img width="200" alt="Screenshot" src="https://user-images.githubusercontent.com/34390549/145694895-d7e77c3e-cd5f-49b3-9033-e42ac359c471.png">
<img width="200" alt="Screenshot" src="https://user-images.githubusercontent.com/34390549/145694897-2d611ff6-8768-46de-b1b3-f0e9b34ddf5e.png">

## Screens

- Home (`lib/home.dart`): side drawer, search field (UI only), a horizontal list of selectable food categories, and a list of popular items. Tapping an item opens its detail page.
- Food detail (`lib/foodDetail.dart`): price, crust and delivery time, S/M/L size picker that updates the price, an ingredients row, a favourite toggle, and a "Place an Order" button that isn't wired to anything.

## Built with

- Flutter 2.5 (stable), Dart SDK constraint `>=2.7.0 <3.0.0`, so the code predates null safety
- `flutter_svg` 0.22 for the category icons
- Poppins font, bundled in `fonts/`

Because it isn't null safe, it won't build on Dart 3 / current Flutter without migrating. Use a Flutter 2.x SDK to run it as-is.

## Running it

```bash
flutter pub get
flutter run
```
