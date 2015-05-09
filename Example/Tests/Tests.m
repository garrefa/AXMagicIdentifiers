//
//  AXMagicIdentifiersTests.m
//  AXMagicIdentifiersTests
//
//  Created by Alexandre Garrefa on 05/08/2015.
//  Copyright (c) 2014 Alexandre Garrefa. All rights reserved.
//

SPEC_BEGIN(InitialTests)

describe(@"My initial tests", ^{

  context(@"will fail", ^{

      xit(@"can do maths", ^{
          [[@1 should] equal:@2];
      });
      
      xit(@"can read", ^{
          [[@"number" should] equal:@"string"];
      });
      
      xit(@"will wait and fail", ^{
          NSObject *object = [[NSObject alloc] init];
          [[expectFutureValue(object) shouldEventually] receive:@selector(autoContentAccessingProxy)];
      });

  });

  context(@"will pass", ^{
    
      xit(@"can do maths", ^{
        [[@1 should] beLessThan:@23];
      });
    
      xit(@"can read", ^{
          [[@"team" shouldNot] containString:@"I"];
      });
  });
  
});

SPEC_END
