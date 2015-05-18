//
//  UISwitchSpec.m
//  AXMagicIdentifiers
//
//  Created by Alexandre Garrefa on 5/17/15.
//  Copyright 2015 Alexandre Garrefa. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import <AXMagicIdentifiers.h>


SPEC_BEGIN(UISwitchSpec)

describe(@"UISwitch with MagicId Category", ^{
    
    __block UIViewController *_vc;
    __block UISwitch *_switch01;
    __block UISwitch *_switch02;
    
    beforeEach(^{
        
        _switch01 = [[UISwitch alloc] init];
        _switch02 = [[UISwitch alloc] init];
        
        _vc = [[UIViewController alloc] init];
        [_vc.view addSubview:_switch01];
        [_vc.view addSubview:_switch02];
        [_vc ax_addAccId];
    });
    
    context(@"UISwitch", ^{
        
        it(@"should have accessibility identifier", ^{
            
            [[_switch01.accessibilityIdentifier shouldNot] beNil];
            [[_switch01.accessibilityIdentifier should] equal:@"AX_UIViewController_SWITCH_1"];
            
            [[_switch02.accessibilityIdentifier shouldNot] beNil];
            [[_switch02.accessibilityIdentifier should] equal:@"AX_UIViewController_SWITCH_2"];
        });
        
        it(@"should not set accessibility identifier if already set outside MagicId", ^{
            
            UISwitch *aSwitch = [[UISwitch alloc] init];
            aSwitch.accessibilityIdentifier = @"ANY_ACCESSIBILITY_IDENTIFIER";
            [_vc.view addSubview:aSwitch];
            [_vc ax_addAccId];
            [[aSwitch.accessibilityIdentifier should] equal:@"ANY_ACCESSIBILITY_IDENTIFIER"];
        });
    });
    
});

SPEC_END
