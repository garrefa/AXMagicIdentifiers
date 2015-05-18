//
//  UIButtonSpec.m
//  AXMagicIdentifiers
//
//  Created by Alexandre Garrefa on 5/17/15.
//  Copyright 2015 Alexandre Garrefa. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import <AXMagicIdentifiers.h>

SPEC_BEGIN(UIButtonSpec)

describe(@"UIButton with MagicId Category", ^{

    __block UIViewController *_vc;
    __block UIButton *_btn01;
    __block UIButton *_btn02;
    
    beforeEach(^{
        
        _btn01 = [[UIButton alloc] init];
        [_btn01 setTitle:@"Confirm" forState:UIControlStateNormal];
        
        _btn02  = [[UIButton alloc] init];
        [_btn02 setTitle:@"Cancel" forState:UIControlStateNormal];
        
        _vc = [[UIViewController alloc] init];
        [_vc.view addSubview:_btn01];
        [_vc.view addSubview:_btn02];
        [_vc ax_addAccId];
    });
    
    context(@"UIButtons", ^{
        
        it(@"should have accessibility identifier", ^{
           
            [[_btn01.accessibilityIdentifier shouldNot] beNil];
            [[_btn02.accessibilityIdentifier shouldNot] beNil];

            [[_btn01.accessibilityIdentifier should] equal:@"AX_UIViewController_BUTTON_Confirm"];
            [[_btn02.accessibilityIdentifier should] equal:@"AX_UIViewController_BUTTON_Cancel"];
        });
        
        it(@"should update accessibility identifier if title changes", ^{
            
            [_btn01 setTitle:@"New Title" forState:UIControlStateNormal];
            [_btn01 ax_addAccId];
            [[_btn01.accessibilityIdentifier should] equal:@"AX_UIViewController_BUTTON_New_Title"];
        });
        
        it(@"should not update accessibility identifier if already set outside MagicId", ^{
            
            _btn01.accessibilityIdentifier = @"ANY_ACCESSIBILITY_IDENTIFIER";
            [_btn01 setTitle:@"New Title" forState:UIControlStateNormal];
            [_btn01 ax_addAccId];
            [[_btn01.accessibilityIdentifier should] equal:@"ANY_ACCESSIBILITY_IDENTIFIER"];
        });
    });
    
});

SPEC_END
