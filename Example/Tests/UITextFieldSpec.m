//
//  UITextFieldSpec.m
//  AXMagicIdentifiers
//
//  Created by Alexandre Garrefa on 5/17/15.
//  Copyright 2015 Alexandre Garrefa. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import <AXMagicIdentifiers.h>


SPEC_BEGIN(UITextFieldSpec)

describe(@"UITextField with MagicId Category", ^{
    
    __block UIViewController *_vc;
    __block UITextField *_textField01;
    __block UITextField *_textField02;
    
    beforeEach(^{
        
        _textField01 = [[UITextField alloc] init];
        _textField02 = [[UITextField alloc] init];
        
        _vc = [[UIViewController alloc] init];
        [_vc.view addSubview:_textField01];
        [_vc.view addSubview:_textField02];
        [_vc ax_addAccId];
    });
    
    context(@"UITextField", ^{
        
        it(@"should have accessibility identifier", ^{
            
            [[_textField01.accessibilityIdentifier shouldNot] beNil];
            [[_textField01.accessibilityIdentifier should] equal:@"AX_UIViewController_TFIELD_1"];
            
            [[_textField02.accessibilityIdentifier shouldNot] beNil];
            [[_textField02.accessibilityIdentifier should] equal:@"AX_UIViewController_TFIELD_2"];
        });
        
        it(@"should not set accessibility identifier if already set outside MagicId", ^{
            
            UITextField *aTextField = [[UITextField alloc] init];
            aTextField.accessibilityIdentifier = @"ANY_ACCESSIBILITY_IDENTIFIER";
            [_vc.view addSubview:aTextField];
            [_vc ax_addAccId];
            [[aTextField.accessibilityIdentifier should] equal:@"ANY_ACCESSIBILITY_IDENTIFIER"];
        });
    });
    
});

SPEC_END
