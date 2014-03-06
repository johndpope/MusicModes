//
//  AMUtilities.h
//  AncientModes
//
//  Created by Vladimir Mollov on 2/5/14.
//  Copyright (c) 2014 Vladimir Mollov. All rights reserved.
//

@interface AMUtilities : NSObject

uint32_t randomIntInRange(NSRange range);

BOOL isNoteValid(NSString* noteName);
NSArray* parseNote(NSString* note);
UInt8 MIDIValueForNote(NSString* note);
@end