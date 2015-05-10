# AXMagicIdentifiers

[![CI Status](http://img.shields.io/travis/garrefa/AXMagicIdentifiers.svg?style=flat)](https://travis-ci.org/garrefa/AXMagicIdentifiers)
[![Version](https://img.shields.io/cocoapods/v/AXMagicIdentifiers.svg?style=flat)](http://cocoapods.org/pods/AXMagicIdentifiers)
[![License](https://img.shields.io/cocoapods/l/AXMagicIdentifiers.svg?style=flat)](http://cocoapods.org/pods/AXMagicIdentifiers)
[![Platform](https://img.shields.io/cocoapods/p/AXMagicIdentifiers.svg?style=flat)](http://cocoapods.org/pods/AXMagicIdentifiers)

## Usage

Just do import the magical header in your pch file and you are done.

```ruby
#import <AXMagicIdentifiers.h>
```

From now on, lets call accessibilityIdentifier property as accID.

What this does:

- ax_printAccessibilityIdentifiers: Util method for UIViewController and subclasses to print all accIDs in the view hierarchy.
- Top levem UIViews have accID set as 'CLASS_NAME'_VIEW.
- UITableViewCells have accID set as 'CLASS_NAME'_CELL_S'SECTION_NUMBER'R'ROW_NUMBER'.
- UICollectionViewCells have accID set as 'CLASS_NAME'_CELL_S'SECTION_NUMBER'R'ROW_NUMBER'.
- UIButtons have accID set as 'CLASS_NAME'_BUTTON_'BUTTON_TITLE'.
- UIButtons will auto update accID when button title changes.
- UITextView have accID set as 'CLASS_NAME'_TXTVIEW_'INDEX'.
- UITextField have accID set as 'CLASS_NAME'_TFIELD_'INDEX'.
- UIPageControll have accID set as 'CLASS_NAME'_PAGEC_'INDEX'.
- UIPickerView have accID set as 'CLASS_NAME'_PVIEW_'INDEX'.
- UISwitch have accID set as 'CLASS_NAME'_SWITCH_'INDEX'.

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
