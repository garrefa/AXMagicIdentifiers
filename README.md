# AXMagicIdentifiers

[![CI Status](http://img.shields.io/travis/garrefa/AXMagicIdentifiers.svg?style=flat)](https://travis-ci.org/garrefa/AXMagicIdentifiers)
[![Version](https://img.shields.io/cocoapods/v/AXMagicIdentifiers.svg?style=flat)](http://cocoapods.org/pods/AXMagicIdentifiers)
[![License](https://img.shields.io/cocoapods/l/AXMagicIdentifiers.svg?style=flat)](http://cocoapods.org/pods/AXMagicIdentifiers)
[![Platform](https://img.shields.io/cocoapods/p/AXMagicIdentifiers.svg?style=flat)](http://cocoapods.org/pods/AXMagicIdentifiers)

## Usage

Just do '#import \<AXMagicIdentifiers.h\>' in your pch file and you are done.

From now on, lets call accessibilityIdentifier property as accID.

What this does:

- ax_printAccessibilityIdentifiers: Util method for UIViewController and subclasses to print all accIDs in the view hierarchy.
- Top levem UIViews have accID set as 'CLASS_NAME'_VIEW.
- UIButtons have accID set as 'CLASS_NAME'_BUTTON_'BUTTON_TITLE'.
- UIButtons will auto update accID when button title changes.
- UITableViewCells have accID set as 'CLASS_NAME'_CELL_S'SECTION_NUMBER'R'ROW_NUMBER'.
- UICollectionViewCells have accID set as 'CLASS_NAME'_CELL_S'SECTION_NUMBER'R'ROW_NUMBER'.

Supports iOS >= 7.0

## Installation

AXMagicIdentifiers is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "AXMagicIdentifiers"
```

## Next Releases

- Support for UITextFields, UISwitches, UIPickerView and other elements in the way.

## Author

Alexandre Garrefa, alexmrg@gmail.com

## License

AXMagicIdentifiers is available under the MIT license. See the LICENSE file for more info.
