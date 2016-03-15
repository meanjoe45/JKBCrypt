# JKBCrypt

JKBCrypt is an implementation of bcrypt written in Swift. It currently is able to generate the salt and hash a phrase using a generated salt.

## Importing the Code

Import the files from the `lib/` directory into your Swift project where you feel is appropriate. Eventually, I'd like to get this project into a CocoaPod, but this has not happened yet.

Or use the CocoaPod.

## Using the Code

```
JKBCrypt.generateSaltWithNumberOfRounds(rounds: UInt) -> String
JKBCrypt.generateSalt() -> String
JKBCrypt.hashPassword(password: String, withSalt salt: String) -> String?
JKBCrypt.verifyPassword(password: String, matchesHash hash: String) -> Bool?
```

The `generateSaltWithNumberOfRounds()` class function will generate a random salt using the number of rounds provided. The number of rounds must be between 4 and 31 inclusively.

The `generateSalt()` class convenience function will generate a random salt using a default 10 rounds. This number can be adjusted based on your specific needs.

The `hashPassword(withSalt:)` class function will hash the password phrase using the salt. If there is an issue during processing, nil will be returned. Check the function documentation for details.

The `verifyPassword(matchesHash:)` class convenience function will hash the password phrase using the hash, then return the comparison between the new hash and the given hash. If there is an issue during processing, nil will be returned. Check the function documentation for details.

## Example

There is an example Xcode project that uses the JKBCrypt functions to calculate salts, hashes, and compare hashes. See the example project for a better understanding on how to use the functions.

## Roadmap

### Testing

More tests for the functions in the `JKBCrypt` and `JKBCryptRandom` classes.

### Optimization

The code was written in Swift2. The code was optimized by using `UnsafePointer<Type>` for much of the array indexing but is still significantly slower than bcrypt running in Objective-C on the same machine (Objective-C: ~0.2s/10 rnds; Swift: 4-5s/10 rnds)._Needs to be verified for Swift2._

## Issues, Bugs, etc.

If you have any issues, bugs, or feature suggestions, please create an issue.

## Credits

This project was inspired by and based on the Objective-C port by Jay Fuerstenberg ([Git Repo](https://github.com/jayfuerstenberg/JFCommon)).

The Objective-C port is based on the original Java implementation by Damien Miller found [here](http://www.mindrot.org/projects/jBCrypt/).
