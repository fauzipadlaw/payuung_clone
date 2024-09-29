import 'package:flutter/material.dart';
import 'package:payuung_clone/pages/components/custom_button.dart';
import 'package:payuung_clone/pages/personal_info/components/custom_field.dart';
import 'package:payuung_clone/pages/personal_info/components/custom_select_field.dart';
import 'package:payuung_clone/pages/personal_info/components/ktp_field.dart';
import 'package:payuung_clone/utils/colors.dart';

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
  bool _domicileSameWithId = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const KtpField(),
            const SizedBox(
              height: 20,
            ),
            const CustomField(
              label: 'alamat sesuai ktp',
            ),
            const CustomSelectField(
              label: 'provinsi',
              items: [],
            ),
            const CustomSelectField(
              label: 'kota/kabupaten',
              items: [],
            ),
            const CustomSelectField(
              label: 'kecamatan',
              items: [],
            ),
            const CustomSelectField(
              label: 'kelurahan',
              items: [],
            ),
            const CustomField(label: 'kode pos'),
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
                        },
                      ),
                    ),
                  ),
                  const Text('Alamat domisili sama dengan alamat KTP'),
                ],
              ),
            ),
            if (!_domicileSameWithId)
              const Column(
                children: [
                  CustomField(label: 'alamat domisili'),
                  CustomSelectField(
                    label: 'provinsi',
                    items: [],
                  ),
                  CustomSelectField(
                    label: 'kota/kabupaten',
                    items: [],
                  ),
                  CustomSelectField(
                    label: 'kecamatan',
                    items: [],
                  ),
                  CustomSelectField(
                    label: 'kelurahan',
                    items: [],
                  ),
                  CustomField(label: 'kode pos'),
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
                    onTap: () => widget.onSubmit(),
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
