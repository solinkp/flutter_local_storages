# Flutter local storages demo

A simple implementation of various local storage options, using the Rick & Morty public API. Focused mainly on the storage aspect for future references.

# SDKS
- Flutter: 3.13.9
- Dart: 3.1.5

# Databases Details

## Isar
### Supported Platforms
- ANDROID ✅
- IOS ✅
- WEB ❌
### Dependencies
- isar
- isar_flutter_libs
- isar_generator
- path_provider

## Hive
### Supported Platforms
- ANDROID ✅
- IOS ✅
- WEB ✅
### Dependencies
- hive
- hive_flutter
- hive_generator
- path_provider

## Objectbox
### Supported Platforms
- ANDROID ✅
- IOS ✅
- WEB ❌
### Dependencies
- objectbox
- objectbox_flutter_libs
- objectbox_generator
- path_provider
- path

## Sembast
### Supported Platforms
- ANDROID ✅
- IOS ✅
- WEB => sembast_web ✅
### Dependencies
- sembast
- path_provider
- path

## CBL
### Supported Platforms
- ANDROID ✅
- IOS ✅
- WEB ❌
### Dependencies
- cbl
- cbl_flutter
- cbl_flutter_ce
- path_provider

## Realm
### Supported Platforms
- ANDROID ✅
- IOS ✅
- WEB ❌
### Dependencies
- realm

## SQFLite
### Supported Platforms
- ANDROID ✅
- IOS ✅
- WEB ❌
### Dependencies
- sqflite
- path

## Floor
### Supported Platforms
- ANDROID ✅
- IOS ✅
- WEB ❌
### Dependencies
- floor
- sqflite
- floor_generator

## Drift
### Supported Platforms
- ANDROID ✅
- IOS ✅
- WEB ✅
### Dependencies
- drift
- sqlite3_flutter_libs
- path_provider
- path
- drift_dev
### Conflicts
Has conflicts with Floor 1.4.2 dependecies -> had to downgrade Floor to 1.4.1

# Personal Ranking (2023)
## NoSQL
1. Isar
2. Objectbox
3. Sembast
4. Realm
5. Hive
6. CBL
## SQL
1. Floor
2. SQFLite
3. Drift