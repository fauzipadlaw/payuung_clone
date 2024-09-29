import 'package:flutter/material.dart';
import 'package:payuung_clone/pages/components/custom_button.dart';
import 'package:payuung_clone/pages/personal_info/components/custom_field.dart';
import 'package:payuung_clone/pages/personal_info/components/custom_select_field.dart';
import 'package:payuung_clone/pages/personal_info/components/ktp_field.dart';
import 'package:payuung_clone/utils/colors.dart';

import '../../../models/profile.dart';
import '../../../services/database_service.dart';

class AddressForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Function onSubmit;
  final Function onBack;
  const AddressForm({
    super.key,
    required this.formKey,
    required this.onSubmit,
    required this.onBack,
  });

  @override
  State<AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  final TextEditingController _image = TextEditingController();
  final TextEditingController _nik = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _province = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _distric = TextEditingController();
  final TextEditingController _kelurahan = TextEditingController();
  final TextEditingController _postalCode = TextEditingController();
  final TextEditingController _addressD = TextEditingController();
  final TextEditingController _provinceD = TextEditingController();
  final TextEditingController _cityD = TextEditingController();
  final TextEditingController _districD = TextEditingController();
  final TextEditingController _kelurahanD = TextEditingController();
  final TextEditingController _postalCodeD = TextEditingController();
  bool _domicileSameWithId = true;
  final _db = DatabaseService.instance;

  @override
  initState() {
    _db.getProfile().then((Profile profile) {
      setState(() {
        _image.text = profile.ktpImage ?? '';
        _nik.text = profile.nik ?? '';
        _address.text = profile.address ?? '';
        _province.text = profile.province ?? '';
        _city.text = profile.city ?? '';
        _distric.text = profile.distric ?? '';
        _kelurahan.text = profile.kelurahan ?? '';
        _addressD.text = profile.domicileAddress ?? '';
        _provinceD.text = profile.domicileProvince ?? '';
        _cityD.text = profile.domicileCity ?? '';
        _districD.text = profile.domicileDistric ?? '';
        _kelurahanD.text = profile.domicileKelurahan ?? '';
        _postalCode.text = profile.postalCode.toString();
        _postalCodeD.text = profile.domicilePostalCode.toString();

        if (_domicileSameWithId) {
          _domicileSameWithId = !_domicileSameWithId;
          _addressD.text = _address.text;
          _provinceD.text = _province.text;
          _cityD.text = _city.text;
          _districD.text = _distric.text;
          _kelurahanD.text = _kelurahan.text;
          _postalCodeD.text = _postalCode.text;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            KtpField(
              nikController: _nik,
              imageController: _image,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomField(
              controller: _address,
              label: 'alamat sesuai ktp',
            ),
            CustomSelectField(
              controller: _province,
              label: 'provinsi',
              items: const [
                DropdownMenuItem(
                  value: 'A',
                  child: Text('A'),
                ),
                DropdownMenuItem(
                  value: 'B',
                  child: Text('B'),
                ),
                DropdownMenuItem(
                  value: 'C',
                  child: Text('C'),
                ),
                DropdownMenuItem(
                  value: 'D',
                  child: Text('D'),
                ),
              ],
            ),
            CustomSelectField(
              controller: _city,
              label: 'kota/kabupaten',
              items: const [
                DropdownMenuItem(
                  value: 'A',
                  child: Text('A'),
                ),
                DropdownMenuItem(
                  value: 'B',
                  child: Text('B'),
                ),
                DropdownMenuItem(
                  value: 'C',
                  child: Text('C'),
                ),
                DropdownMenuItem(
                  value: 'D',
                  child: Text('D'),
                ),
              ],
            ),
            CustomSelectField(
              controller: _distric,
              label: 'kecamatan',
              items: const [
                DropdownMenuItem(
                  value: 'A',
                  child: Text('A'),
                ),
                DropdownMenuItem(
                  value: 'B',
                  child: Text('B'),
                ),
                DropdownMenuItem(
                  value: 'C',
                  child: Text('C'),
                ),
                DropdownMenuItem(
                  value: 'D',
                  child: Text('D'),
                ),
              ],
            ),
            CustomSelectField(
              controller: _kelurahan,
              label: 'kelurahan',
              items: const [
                DropdownMenuItem(
                  value: 'A',
                  child: Text('A'),
                ),
                DropdownMenuItem(
                  value: 'B',
                  child: Text('B'),
                ),
                DropdownMenuItem(
                  value: 'C',
                  child: Text('C'),
                ),
                DropdownMenuItem(
                  value: 'D',
                  child: Text('D'),
                ),
              ],
            ),
            CustomField(controller: _postalCode, label: 'kode pos'),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  Container(
                    height: 24,
                    width: 24,
                    margin: const EdgeInsets.only(right: 8),
                    child: Checkbox(
                      fillColor: WidgetStateProperty.resolveWith<Color>(
                          (Set<WidgetState> states) {
                        if (states.contains(WidgetState.selected)) {
                          return AppColors.yellow;
                        }
                        return Colors.white;
                      }),
                      value: _domicileSameWithId,
                      onChanged: (v) => setState(
                        () {
                          _domicileSameWithId = !_domicileSameWithId;
                          _addressD.text = _address.text;
                          _provinceD.text = _province.text;
                          _cityD.text = _city.text;
                          _districD.text = _distric.text;
                          _kelurahanD.text = _kelurahan.text;
                          _postalCodeD.text = _postalCode.text;
                        },
                      ),
                    ),
                  ),
                  const Text('Alamat domisili sama dengan alamat KTP'),
                ],
              ),
            ),
            if (!_domicileSameWithId)
              Column(
                children: [
                  CustomField(
                    label: 'alamat domisili',
                    controller: _addressD,
                  ),
                  CustomSelectField(
                    label: 'provinsi',
                    controller: _provinceD,
                    items: const [
                      DropdownMenuItem(
                        value: 'A',
                        child: Text('A'),
                      ),
                      DropdownMenuItem(
                        value: 'B',
                        child: Text('B'),
                      ),
                      DropdownMenuItem(
                        value: 'C',
                        child: Text('C'),
                      ),
                      DropdownMenuItem(
                        value: 'D',
                        child: Text('D'),
                      ),
                    ],
                  ),
                  CustomSelectField(
                    controller: _cityD,
                    label: 'kota/kabupaten',
                    items: const [
                      DropdownMenuItem(
                        value: 'A',
                        child: Text('A'),
                      ),
                      DropdownMenuItem(
                        value: 'B',
                        child: Text('B'),
                      ),
                      DropdownMenuItem(
                        value: 'C',
                        child: Text('C'),
                      ),
                      DropdownMenuItem(
                        value: 'D',
                        child: Text('D'),
                      ),
                    ],
                  ),
                  CustomSelectField(
                    controller: _districD,
                    label: 'kecamatan',
                    items: const [
                      DropdownMenuItem(
                        value: 'A',
                        child: Text('A'),
                      ),
                      DropdownMenuItem(
                        value: 'B',
                        child: Text('B'),
                      ),
                      DropdownMenuItem(
                        value: 'C',
                        child: Text('C'),
                      ),
                      DropdownMenuItem(
                        value: 'D',
                        child: Text('D'),
                      ),
                    ],
                  ),
                  CustomSelectField(
                    controller: _kelurahanD,
                    label: 'kelurahan',
                    items: const [
                      DropdownMenuItem(
                        value: 'A',
                        child: Text('A'),
                      ),
                      DropdownMenuItem(
                        value: 'B',
                        child: Text('B'),
                      ),
                      DropdownMenuItem(
                        value: 'C',
                        child: Text('C'),
                      ),
                      DropdownMenuItem(
                        value: 'D',
                        child: Text('D'),
                      ),
                    ],
                  ),
                  CustomField(controller: _postalCodeD, label: 'kode pos'),
                ],
              ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: 'Sebelumnya',
                    type: ButtonType.seconday,
                    onTap: () => widget.onBack(),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomButton(
                    text: 'Selanjutnya',
                    onTap: () {
                      _db.update('profile', {
                        'nik': _nik.text != '' ? _nik.text : null,
                        'ktp_image': _image.text != '' ? _image.text : null,
                        'address': _address.text != '' ? _address.text : null,
                        'province':
                            _province.text != '' ? _province.text : null,
                        'city': _city.text != '' ? _city.text : null,
                        'distric': _distric.text != '' ? _distric.text : null,
                        'kelurahan':
                            _kelurahan.text != '' ? _kelurahan.text : null,
                        'postal_code':
                            _postalCode.text != '' ? _postalCode.text : null,
                        'domicile_address':
                            _addressD.text != '' ? _addressD.text : null,
                        'domicile_province':
                            _provinceD.text != '' ? _provinceD.text : null,
                        'domicile_city': _cityD.text != '' ? _cityD.text : null,
                        'domicile_distric':
                            _districD.text != '' ? _districD.text : null,
                        'domicile_kelurahan':
                            _kelurahanD.text != '' ? _kelurahanD.text : null,
                        'domicile_postal_code':
                            _postalCodeD.text != '' ? _postalCodeD.text : null,
                      });
                      widget.onSubmit();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
