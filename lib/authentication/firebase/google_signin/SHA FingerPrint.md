# Create debug.keystore:
<code>keytool -genkey -v -keystore debug.keystore -storepass [storepass] -alias [alias-name] -keypass [keypass] -keyalg RSA -keysize 2048 -validity 10000</code>
eg:
<code>keytool -genkey -v -keystore debug.keystore -storepass android -alias androiddebugkey -keypass android -keyalg RSA -keysize 2048 -validity 10000</code>


# Display the SHA Certification Finger Print:

<code>keytool -list -v -keystore [keystore path] -alias [alias-name] -storepass [storepass] -keypass [keypass]</code>
eg:
<code>keytool -list -v -keystore "C:\Users\user\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android</code>

# Create release.keystore:
keytool -genkey -v -keystore release.keystore -alias [alias_name] -keyalg RSA -keysize 2048 -validity 10000

# Values of the fields in this project:
[keystor path]: "C:\Users\user\.android\debug.keystore"
[alias-name]: androiddebugkey
[storepass]: android
[keypass]: android
