# AXMagicIdentifiers

[![Platform](https://img.shields.io/cocoapods/p/AXMagicIdentifiers.svg?style=flat)](http://cocoapods.org/pods/AXMagicIdentifiers)
[![License](https://img.shields.io/cocoapods/l/AXMagicIdentifiers.svg?style=flat)](http://cocoapods.org/pods/AXMagicIdentifiers)

**This project is not under development and is SHOULD NOT be used in production.**

The source code is still available only for study reasons and what i learned was: 

> Don't do black magic with method swizzling. Just because you can, don't mean you should.

When you do swizzling be very careful not to do it in a very generic class. People can subclass it in
so many crazy ways you simply cannot garantee there wont be problems. And for this one, **I can garantee**
you will have problems if you try to use it in production.  

That said, it was a fun project and thats why its still here. And yes, Peter Steinberger warned me that this
black magic wasn't a good idea. He knew it, i didn't ;)

![steipete](./steipete.png)

## Usage

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
