import 'package:cli_firebase/model/aba_model.dart';

class ProductController {
  // Integration with state management
  final List<AbaModel> products = <AbaModel>[
    AbaModel(id: 1, name: 'Accounts', image: ""),
    AbaModel(
        id: 2,
        name: 'Cards',
        image:
            "https://images.pexels.com/photos/29690514/pexels-photo-29690514/free-photo-of-man-relaxing-in-outdoor-cafe-in-pula-croatia.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load"),
    AbaModel(
        id: 3,
        name: 'Payments',
        image:
            "https://images.pexels.com/photos/27245603/pexels-photo-27245603/free-photo-of-car-by-grabrok-on-iceland.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load"),
    AbaModel(
        id: 4,
        name: 'Aba Scan',
        image:
            "https://images.pexels.com/photos/27245603/pexels-photo-27245603/free-photo-of-car-by-grabrok-on-iceland.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load"),
    AbaModel(
        id: 5,
        name: 'FAvorites',
        image:
            "https://images.pexels.com/photos/27245603/pexels-photo-27245603/free-photo-of-car-by-grabrok-on-iceland.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load"),
    AbaModel(
        id: 6,
        name: 'Transfers',
        image:
            "https://images.pexels.com/photos/27245603/pexels-photo-27245603/free-photo-of-car-by-grabrok-on-iceland.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load"),
  ];
}
