//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: ../../../andr-demo-prj/app/src/main/java/com/prod/vals/andr_demo_prj/Bootstrap.java
//

#ifndef _Bootstrap_H_
#define _Bootstrap_H_

#include "J2ObjC_header.h"

@protocol SQLighterDb;

@interface Bootstrap : NSObject

#pragma mark Public

- (instancetype)init;

+ (Bootstrap *)getInstance;

- (id<SQLighterDb>)getSqLighterDb;

- (void)setSqLighterDbWithSQLighterDb:(id<SQLighterDb>)sqLighterDb;

@end

J2OBJC_EMPTY_STATIC_INIT(Bootstrap)

FOUNDATION_EXPORT Bootstrap *Bootstrap_getInstance();

FOUNDATION_EXPORT void Bootstrap_init(Bootstrap *self);

FOUNDATION_EXPORT Bootstrap *new_Bootstrap_init() NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(Bootstrap)

typedef Bootstrap ComProdValsAndr_demo_prjBootstrap;

#endif // _Bootstrap_H_
