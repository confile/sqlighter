//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: ../../../andr-demo-prj/app/src/main/java/com/prod/vals/andr_demo_prj/Demo.java
//


#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "com/prod/vals/andr_demo_prj/Bootstrap.h"
#include "com/prod/vals/andr_demo_prj/Demo.h"
#include "com/vals/a2ios/sqlighter/intf/SQLighterDb.h"
#include "com/vals/a2ios/sqlighter/intf/SQLighterRs.h"
#include "java/io/PrintStream.h"
#include "java/lang/Double.h"
#include "java/lang/Exception.h"
#include "java/lang/Long.h"
#include "java/lang/System.h"

@interface Demo ()

+ (void)printWithSQLighterRs:(id<SQLighterRs>)rs;

@end

__attribute__((unused)) static void Demo_printWithSQLighterRs_(id<SQLighterRs> rs);

@implementation Demo

+ (void)printWithSQLighterRs:(id<SQLighterRs>)rs {
  Demo_printWithSQLighterRs_(rs);
}

+ (NSString *)dbOperations {
  return Demo_dbOperations();
}

- (instancetype)init {
  Demo_init(self);
  return self;
}

@end

void Demo_printWithSQLighterRs_(id<SQLighterRs> rs) {
  Demo_initialize();
  JavaLangLong *pk = [((id<SQLighterRs>) nil_chk(rs)) getLongWithInt:0];
  NSString *e = [rs getStringWithInt:1];
  NSString *n = [rs getStringWithInt:2];
  IOSByteArray *dataBytes = [rs getBlobWithInt:3];
  NSString *dataString = nil;
  if (dataBytes != nil) {
    dataString = [NSString stringWithBytes:dataBytes];
  }
  NSNumber *h = [rs getDoubleWithInt:4];
  [((JavaIoPrintStream *) nil_chk(JavaLangSystem_get_out_())) printlnWithNSString:JreStrcat("$@$$$$$$$@", @"pk: ", pk, @", email: ", e, @", name: ", n, @", blob data: ", dataString, @", height: ", h)];
}

NSString *Demo_dbOperations() {
  Demo_initialize();
  NSString *greetingStr = nil;
  @try {
    id<SQLighterDb> db = [((Bootstrap *) nil_chk(Bootstrap_getInstance())) getSqLighterDb];
    id<SQLighterRs> rs = [((id<SQLighterDb>) nil_chk(db)) executeSelectWithNSString:@"select id, email, name, data, height from user"];
    [((JavaIoPrintStream *) nil_chk(JavaLangSystem_get_out_())) printlnWithNSString:@"initial state "];
    while ([((id<SQLighterRs>) nil_chk(rs)) hasNext]) {
      Demo_printWithSQLighterRs_(rs);
    }
    [rs close];
    NSString *dataStr = @"Hello, sqlighter!";
    IOSByteArray *data = [dataStr getBytes];
    [db addParamWithNSString:@"user name 5"];
    [db addParamWithNSString:@"qw@er.ty1"];
    [db addParamWithByteArray:data];
    [db addParamWithDouble:5.67];
    [db executeChangeWithNSString:@"insert into user( name, email, data, height) values (?, ?, ?, ?)"];
    [db addParamWithNSString:@"qw@er.ty1"];
    [JavaLangSystem_get_out_() printlnWithNSString:@"check if the record was inserted"];
    rs = [db executeSelectWithNSString:@"select id, email, name, data, height from user where email = ?"];
    while ([((id<SQLighterRs>) nil_chk(rs)) hasNext]) {
      Demo_printWithSQLighterRs_(rs);
    }
    [rs close];
    [db addParamNull];
    [db addParamWithNSString:@"qw@er.ty1"];
    [db executeChangeWithNSString:@"update user set email = ? where email = ?"];
    [JavaLangSystem_get_out_() printlnWithNSString:@"after update state 1"];
    rs = [db executeSelectWithNSString:@"select id, email, name, data, height from user"];
    while ([((id<SQLighterRs>) nil_chk(rs)) hasNext]) {
      Demo_printWithSQLighterRs_(rs);
    }
    [rs close];
    [db addParamWithNSString:@"user@email.com"];
    [db addParamWithNSString:@"qw@er.ty1"];
    [db executeChangeWithNSString:@"update user set email = ? where email is null or email = ?"];
    [JavaLangSystem_get_out_() printlnWithNSString:@"after update state 2"];
    rs = [db executeSelectWithNSString:@"select id, email, name, data, height from user"];
    while ([((id<SQLighterRs>) nil_chk(rs)) hasNext]) {
      Demo_printWithSQLighterRs_(rs);
      NSString *s = [rs getStringWithInt:1];
      if (![@"user@email.com" isEqual:s]) {
        NSNumber *id_ = [rs getLongWithInt:0];
        [db addParamWithNSString:@"inloop@email.com"];
        [db addParamWithLong:[((NSNumber *) nil_chk(id_)) longLongValue]];
        [db executeChangeWithNSString:@"update user set email = ? where id = ?"];
      }
    }
    [rs close];
    [db addParamWithLong:2];
    [db executeChangeWithNSString:@"delete from user where id = ?"];
    [JavaLangSystem_get_out_() printlnWithNSString:@"after delete state"];
    rs = [db executeSelectWithNSString:@"select id, email, name, data, height from user"];
    while ([((id<SQLighterRs>) nil_chk(rs)) hasNext]) {
      Demo_printWithSQLighterRs_(rs);
    }
    [rs close];
    [db executeChangeWithNSString:@"create table address(id integer primary key autoincrement unique, name text, user_id integer)"];
    [db addParamWithNSString:@"123 main str, walnut creek, ca"];
    [db addParamWithLong:1];
    [db executeChangeWithNSString:@"insert into address(name, user_id) values(?, ?)"];
    [JavaLangSystem_get_out_() printlnWithNSString:@"after address creation/population"];
    rs = [db executeSelectWithNSString:@"select a.user_id, u.email, u.name, u.data, u.height, a.name from user u, address a where a.user_id = u.id"];
    while ([((id<SQLighterRs>) nil_chk(rs)) hasNext]) {
      Demo_printWithSQLighterRs_(rs);
      [JavaLangSystem_get_out_() printlnWithNSString:JreStrcat("$$", @" address: ", [rs getStringWithInt:5])];
    }
    [rs close];
    [db addParamWithDouble:5.67];
    rs = [db executeSelectWithNSString:@"select data from user where height = ?"];
    if ([((id<SQLighterRs>) nil_chk(rs)) hasNext]) {
      IOSByteArray *greet = [rs getBlobWithInt:0];
      greetingStr = [NSString stringWithBytes:greet];
    }
    [rs close];
  }
  @catch (JavaLangException *e) {
    [((JavaLangException *) nil_chk(e)) printStackTrace];
  }
  return greetingStr;
}

void Demo_init(Demo *self) {
  (void) NSObject_init(self);
}

Demo *new_Demo_init() {
  Demo *self = [Demo alloc];
  Demo_init(self);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(Demo)
