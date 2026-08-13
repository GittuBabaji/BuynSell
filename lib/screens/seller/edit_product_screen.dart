import 'package:flutter/material.dart';

/// Screen allowing sellers to edit an existing product listing pre-populated by [productId].
class EditProductScreen extends StatefulWidget {
  final String productId;

  const EditProductScreen({
    super.key,
    required this.productId,
  });

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;
  late TextEditingController _originalPriceController;

  String? _selectedCategory;
  String _selectedCondition = 'Used - Good';
  bool _isLoading = true;

  final List<String> _categories = [
    'Books & Academics',
    'Electronics',
    'Bicycles',
    'Hostel Essentials',
    'Clothing & Accessories',
    'Sports & Fitness',
    'Other',
  ];

  final List<String> _conditions = [
    'Brand New',
    'Like New',
    'Used - Good',
    'Used - Fair',
  ];

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _priceController = TextEditingController();
    _originalPriceController = TextEditingController();

    _loadProductData();
  }

  void _loadProductData() {
    // TODO: Fetch existing product data using widget.productId from API/Database
    // Pre-filling dummy data for demonstration
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        setState(() {
          _titleController.text = 'Sample Existing Product';
          _descriptionController.text = 'Pre-filled description for item ${widget.productId}';
          _priceController.text = '750';
          _originalPriceController.text = '1200';
          _selectedCategory = 'Electronics';
          _selectedCondition = 'Used - Good';
          _isLoading = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _originalPriceController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // TODO: Submit updated product details to backend
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Updating product details...')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product (${widget.productId})'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image Pickers / Current Images Placeholder
                    const Text(
                      'Product Images',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return InkWell(
                              onTap: () {
                                // TODO: Add or update photos
                              },
                              child: Container(
                                width: 100,
                                margin: const EdgeInsets.only(right: 8),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.add_a_photo, color: Colors.grey),
                                    SizedBox(height: 4),
                                    Text('Add Photo', style: TextStyle(fontSize: 12)),
                                  ],
                                ),
                              ),
                            );
                          }
                          return Container(
                            width: 100,
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Icon(Icons.image, color: Colors.grey),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Title Field
                    TextFormField(
                      controller: _titleController,
                      decoration: const InputDecoration(
                        labelText: 'Product Title *',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter a title';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 16),

                    // Category Dropdown
                    DropdownButtonFormField<String>(
                      initialValue: _selectedCategory,
                      decoration: const InputDecoration(
                        labelText: 'Category *',
                        border: OutlineInputBorder(),
                      ),
                      items: _categories.map((cat) {
                        return DropdownMenuItem(
                          value: cat,
                          child: Text(cat),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          _selectedCategory = val;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a category';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 16),

                    // Price Fields Row
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _priceController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Selling Price (₹) *',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Enter price';
                              }
                              if (double.tryParse(value) == null) {
                                return 'Enter valid number';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextFormField(
                            controller: _originalPriceController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Original Price (₹)',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Condition Radio Buttons
                    const Text(
                      'Item Condition *',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    ..._conditions.map((cond) {
                      return RadioListTile<String>(
                        title: Text(cond),
                        value: cond,
                        groupValue: _selectedCondition,
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        onChanged: (val) {
                          if (val != null) {
                            setState(() {
                              _selectedCondition = val;
                            });
                          }
                        },
                      );
                    }),

                    const SizedBox(height: 16),

                    // Description Field
                    TextFormField(
                      controller: _descriptionController,
                      maxLines: 4,
                      decoration: const InputDecoration(
                        labelText: 'Description *',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter product description';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 24),

                    // Save Changes Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _submitForm,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: const Text('Save Changes', style: TextStyle(fontSize: 16)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
