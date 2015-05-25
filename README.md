# AXMagicIdentifiers

[![CI Status](http://img.shields.io/travis/garrefa/AXMagicIdentifiers.svg?style=flat)](https://travis-ci.org/garrefa/AXMagicIdentifiers)
[![Version](https://img.shields.io/cocoapods/v/AXMagicIdentifiers.svg?style=flat)](http://cocoapods.org/pods/AXMagicIdentifiers)
[![License](https://img.shields.io/cocoapods/l/AXMagicIdentifiers.svg?style=flat)](http://cocoapods.org/pods/AXMagicIdentifiers)
[![Platform](https://img.shields.io/cocoapods/p/AXMagicIdentifiers.svg?style=flat)](http://cocoapods.org/pods/AXMagicIdentifiers)

## Usage

**Please, update to version 1.0.6. Older versions had a bug where some delegate methods for UITableViews and UICollectionViews were not being called.**

Just import the magical header in your pch file and you are done.
Keep in mind that this pod should not be used in production release.

```ruby
#import <AXMagicIdentifiers.h>
```

## What this does:

From now on, lets call accessibilityIdentifier property as accID.

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

- Wont change accID if already set.

Supports iOS >= 7.0

## Installation

AXMagicIdentifiers is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "AXMagicIdentifiers", :configuration => ['Debug']
```

## Author

Alexandre Garrefa, alexmrg@gmail.com

## License

AXMagicIdentifiers is available under the MIT license. See the LICENSE file for more info.
