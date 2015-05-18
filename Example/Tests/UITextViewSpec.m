//
//  UITextViewSpec.m
//  AXMagicIdentifiers
//
//  Created by Alexandre Garrefa on 5/17/15.
//  Copyright 2015 Alexandre Garrefa. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import <AXMagicIdentifiers.h>


SPEC_BEGIN(UITextViewSpec)

describe(@"UITextView with MagicId Category", ^{
    
    __block UIViewController *_vc;
    __block UITextView *_textView01;
    __block UITextView *_textView02;
    
    beforeEach(^{
        
        _textView01 = [[UITextView alloc] init];
        _textView02 = [[UITextView alloc] init];
        
        _vc = [[UIViewController alloc] init];
        [_vc.view addSubview:_textView01];
        [_vc.view addSubview:_textView02];
        [_vc ax_addAccId];
    });
    
    context(@"UITextView", ^{
        
        it(@"should have accessibility identifier", ^{
            
            [[_textView01.accessibilityIdentifier shouldNot] beNil];
            [[_textView01.accessibilityIdentifier should] equal:@"AX_UIViewController_TXTVIEW_1"];
            
            [[_textView02.accessibilityIdentifier shouldNot] beNil];
            [[_textView02.accessibilityIdentifier should] equal:@"AX_UIViewController_TXTVIEW_2"];
        });
        
        it(@"should not set accessibility identifier if already set outside MagicId", ^{
            
            UITextView *aTextView = [[UITextView alloc] init];
            aTextView.accessibilityIdentifier = @"ANY_ACCESSIBILITY_IDENTIFIER";
            [_vc.view addSubview:aTextView];
            [_vc ax_addAccId];
            [[aTextView.accessibilityIdentifier should] equal:@"ANY_ACCESSIBILITY_IDENTIFIER"];
        });
    });
    
});

SPEC_END
