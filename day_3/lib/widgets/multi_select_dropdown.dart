import 'package:flutter/material.dart';

class MultiSelectDropdown extends StatefulWidget {
  final List<String> options;
  final List<String> selectedOptions;
  final Function(List<String>) onSelectionChanged;
  final String title;

  const MultiSelectDropdown({
    super.key,
    required this.options,
    required this.selectedOptions,
    required this.onSelectionChanged,
    this.title = "Select at least one option",
  });

  @override
  State<MultiSelectDropdown> createState() => _MultiSelectDropdownState();
}

class _MultiSelectDropdownState extends State<MultiSelectDropdown> {
 List<String> _localSelectedOptions = [];
  
  @override
  void initState() {
    super.initState();
    _localSelectedOptions = List.from(widget.selectedOptions);
  }

  @override
  Widget build(BuildContext context) {
    print('MultiSelectDropdown building with ${widget.options.length} options'); // Debug print
    return Scaffold(
      backgroundColor: Colors.black, 
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(0, 0, 0, 1),
              Color.fromRGBO(25, 23, 23, 1),
              Color.fromRGBO(43, 40, 39, 1),
              Color.fromRGBO(48, 45, 44, 1),
            ],
            stops: [0.0, 0.3, 0.65, 1.0],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
                ),
                SizedBox(height: 20),
  
                Center(
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 40),
                
              
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.options.length,
                    itemBuilder: (context, index) {
                      final option = widget.options[index];
                      final isSelected = _localSelectedOptions.contains(option);
                      
                      return Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: InkWell(
                          onTap: () {
                            print('Option tapped: $option, currently selected: $isSelected'); 
                            setState(() {
                              if (isSelected) {
                                _localSelectedOptions.remove(option);
                                print('Removed $option from selection'); 
                              } else {
                                _localSelectedOptions.add(option);
                                print('Added $option to selection'); 
                              }
                              print('New local selection: $_localSelectedOptions'); 
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color.fromRGBO(255, 79, 0, 1),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: isSelected 
                                  ? Color.fromRGBO(255, 79, 0, 0.1) 
                                  : Colors.transparent,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  option,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color: isSelected 
                                        ? Color.fromRGBO(255, 79, 0, 1) 
                                        : Colors.transparent,
                                    border: Border.all(
                                      color: Color.fromRGBO(255, 79, 0, 1),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: isSelected
                                      ? Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 16,
                                        )
                                      : null,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              
                Container(
                  width: double.infinity,
                  height: 50,
                  margin: EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed: _localSelectedOptions.isNotEmpty
                        ? () {
                            widget.onSelectionChanged(_localSelectedOptions);
                            Navigator.pop(context);
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _localSelectedOptions.isNotEmpty
                          ? Color.fromRGBO(255, 79, 0, 1)
                          : Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text(
                      'Done',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
