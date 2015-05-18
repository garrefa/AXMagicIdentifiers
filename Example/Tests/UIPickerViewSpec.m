//
//  UIPickerViewSpec.m
//  AXMagicIdentifiers
//
//  Created by Alexandre Garrefa on 5/17/15.
//  Copyright 2015 Alexandre Garrefa. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import <AXMagicIdentifiers.h>


SPEC_BEGIN(UIPickerViewSpec)

describe(@"UIPickerView with MagicId Category", ^{
    
    __block UIViewController *_vc;
    __block UIPickerView *_picker01;
    __block UIPickerView *_picker02;
    
    beforeEach(^{
        
        _picker01 = [[UIPickerView alloc] init];
        _picker02 = [[UIPickerView alloc] init];
        
        _vc = [[UIViewController alloc] init];
        [_vc.view addSubview:_picker01];
        [_vc.view addSubview:_picker02];
        [_vc ax_addAccId];
    });
    
    context(@"UIPickerView", ^{
        
        it(@"should have accessibility identifier", ^{
            
            [[_picker01.accessibilityIdentifier shouldNot] beNil];
            [[_picker01.accessibilityIdentifier should] equal:@"AX_UIViewController_PVIEW_1"];
            
            [[_picker02.accessibilityIdentifier shouldNot] beNil];
            [[_picker02.accessibilityIdentifier should] equal:@"AX_UIViewController_PVIEW_2"];
        });
        
        it(@"should not set accessibility identifier if already set outside MagicId", ^{
            
            UIPickerView *aPicker = [[UIPickerView alloc] init];
            aPicker.accessibilityIdentifier = @"ANY_ACCESSIBILITY_IDENTIFIER";
            [_vc.view addSubview:aPicker];
            [_vc ax_addAccId];
            [[aPicker.accessibilityIdentifier should] equal:@"ANY_ACCESSIBILITY_IDENTIFIER"];
        });
    });
    
});

SPEC_END
