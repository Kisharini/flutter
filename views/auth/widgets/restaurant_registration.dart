import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:restaurant_app/common/app_style.dart';
import 'package:restaurant_app/common/custom_button.dart';
import 'package:restaurant_app/constants/constants.dart';
import 'package:restaurant_app/controllers/restaurant_controller.dart';
import 'package:restaurant_app/models/restaurant_request.dart';
import 'package:restaurant_app/views/auth/widgets/email_textfield.dart';

class UploaderController extends GetxController {
  RxString logoUrl = ''.obs;
  RxString coverUrl = ''.obs;

  Future<void> pickImage(String type) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      // Here you can upload the file to your backend or cloud storage
      // Simulate uploaded URL
      final String uploadedUrl = pickedFile.path;

      if (type == 'logo') {
        logoUrl.value = uploadedUrl;
      } else {
        coverUrl.value = uploadedUrl;
      }
    }
  }
}

class RestaurantRegistration extends StatefulWidget {
  const RestaurantRegistration({super.key});

  @override
  State<RestaurantRegistration> createState() => _RestaurantRegistrationState();
}

class _RestaurantRegistrationState extends State<RestaurantRegistration> {
  final PageController _pageController = PageController(initialPage: 0);
  final box = GetStorage();
  GoogleMapController? _mapController;
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _title = TextEditingController();
  final TextEditingController _time = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _postalCode = TextEditingController();
  List<dynamic> _placeList = [];
  LatLng? _selectedLocation;
  final uploader = Get.put(UploaderController());
  final controller = Get.put(RestaurantController());

  @override
  void dispose() {
    _pageController.dispose();
    _searchController.dispose();
    _title.dispose();
    _time.dispose();
    _address.dispose();
    _postalCode.dispose();
    super.dispose();
  }

  void _onMarkerDragEnd(LatLng position) async {
    setState(() {
      _selectedLocation = position;
    });

    final reverseGeoCodingUrl = Uri.parse(
      'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=YOUR_GOOGLE_API_KEY',
    );

    final response = await http.get(reverseGeoCodingUrl);

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final address = responseBody['results'][0]['formatted_address'];
      String postalCode = '';
      final components = responseBody['results'][0]['address_components'];

      for (var component in components) {
        if (component['types'].contains('postal_code')) {
          postalCode = component['long_name'];
        }
      }

      setState(() {
        _searchController.text = address;
        _postalCode.text = postalCode;
        _address.text = address;
        _placeList = [];
      });
    }
  }

  void _searchPlace(String input) async {
    final url = Uri.parse(
      'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&key=YOUR_GOOGLE_API_KEY',
    );

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        _placeList = jsonData['predictions'];
      });
    }
  }

  void _selectPlace(String placeId) async {
    final detailsUrl = Uri.parse(
      'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=YOUR_GOOGLE_API_KEY',
    );

    final response = await http.get(detailsUrl);
    if (response.statusCode == 200) {
      final placeDetails = json.decode(response.body);
      final location = placeDetails['result']['geometry']['location'];
      final latLng = LatLng(location['lat'], location['lng']);

      setState(() {
        _selectedLocation = latLng;
        _mapController?.animateCamera(CameraUpdate.newLatLng(latLng));
        _placeList = [];
        _searchController.text = placeDetails['result']['formatted_address'];
        _address.text = placeDetails['result']['formatted_address'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    height = height;
    width = width;
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        backgroundColor: kPrimary,
        title: Text(
          "Register Restaurant",
          style: appStyle(14, kLightWhite, FontWeight.w600),
        ),
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    GoogleMap(
                      onMapCreated: (controller) => _mapController = controller,
                      initialCameraPosition: CameraPosition(
                        target: _selectedLocation ?? LatLng(3.1390, 101.6869),
                        zoom: 14.0,
                      ),
                      markers:
                          _selectedLocation == null
                              ? {}
                              : {
                                Marker(
                                  markerId: MarkerId('selectedLocation'),
                                  position: _selectedLocation!,
                                  draggable: true,
                                  onDragEnd: _onMarkerDragEnd,
                                ),
                              },
                    ),
                    Positioned(
                      top: 20,
                      left: 20,
                      right: 20,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            color: Colors.white,
                            child: TextField(
                              controller: _searchController,
                              onChanged: _searchPlace,
                              decoration: const InputDecoration(
                                hintText: 'Search your address...',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          if (_placeList.isNotEmpty)
                            Container(
                              color: Colors.white,
                              height: 200,
                              child: ListView.builder(
                                itemCount: _placeList.length,
                                itemBuilder: (context, i) {
                                  return ListTile(
                                    title: Text(_placeList[i]['description']),
                                    onTap: () {
                                      _selectPlace(_placeList[i]['place_id']);
                                    },
                                  );
                                },
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              CustomButton(
                text: "Next",
                onTap:
                    () => _pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    ),
              ),
            ],
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                EmailTextField(
                  controller: _title,
                  hintText: 'Restaurant Title',
                  prefixIcon: const Icon(
                        AntDesign.enviromento,
                        size: 14,
                        color: kGray,
              ),
                ),
                SizedBox(height: 15),
                EmailTextField(
                  controller: _time,
                  hintText: 'Business Hrs',
                  prefixIcon: const Icon(
                AntDesign.enviromento,
                size: 14,
                color: kGray,
              ),
                ),
                SizedBox(height: 15),
                EmailTextField(
                  controller: _postalCode,
                  hintText: 'Postal Code',
                  prefixIcon: const Icon(
                AntDesign.enviromento,
                size: 14,
                color: kGray,
              ),
                ),
                SizedBox(height: 15),
                EmailTextField(
                  controller: _searchController,
                  hintText: 'Address',
                  prefixIcon: const Icon(
                AntDesign.enviromento,
                size: 14,
                color: kGray,
              ),
                ),
                SizedBox(height: 20),

                Text("Upload Logo"),
                GestureDetector(
                  onTap: () => uploader.pickImage('logo'),
                  child: Obx(
                    () =>
                        uploader.logoUrl.isNotEmpty
                            ? Image.file(
                              File(uploader.logoUrl.value),
                              height: 80,
                            )
                            : Container(
                              height: 80,
                              width: 80,
                              color: Colors.grey.withValues(),
                              child: Icon(Icons.camera_alt),
                            ),
                  ),
                ),
                SizedBox(height: 20),
                Text("Upload Cover Image"),
                GestureDetector(
                  onTap: () => uploader.pickImage('cover'),
                  child: Obx(
                    () =>
                        uploader.coverUrl.isNotEmpty
                            ? Image.file(
                              File(uploader.coverUrl.value),
                              height: 120,
                            )
                            : Container(
                              height: 120,
                              width: double.infinity,
                              color: Colors.grey.withValues(),
                              child: Icon(Icons.image),
                            ),
                  ),
                ),

                SizedBox(height: 20),
                CustomButton(
                  text: "Add Restaurant",
                  onTap: () {
                    if (_title.text.isEmpty ||
                        _time.text.isEmpty ||
                        _postalCode.text.isEmpty ||
                        _searchController.text.isEmpty ||
                        uploader.logoUrl.isEmpty ||
                        uploader.coverUrl.isEmpty ||
                        _selectedLocation == null) {
                      Get.snackbar('Error', 'All fields are required');
                      return;
                    }

                    String owner = box.read("userId");
                    final request = RestaurantRequest(
                      title: _title.text,
                      time: _time.text,
                      owner: owner,
                      code: _postalCode.text,
                      logoUrl: uploader.logoUrl.value,
                      imageUrl: uploader.coverUrl.value,
                      coords: Coords(
                        lat: _selectedLocation!.latitude,
                        lng: _selectedLocation!.longitude,
                        id: controller.generateId(),
                        address: _searchController.text,
                        title: _title.text,
                      ),
                    );
                    controller.restaurantRegistration(
                      restaurantRequestToJson(request),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
