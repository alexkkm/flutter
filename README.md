# Flutter

A personal Flutter App for saving the progress and flutter learning process.

### ! ! ! Issues on running release mode ! ! !   
1. run the following code in terminal:
```temrinal
keytool -genkey -v -keystore D:\Users\user\upload-keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias upload
```
```
[NOTES: D:\Users\user\upload-keystore.jks should be changed according to your computer user name]
```
and set the password as <code>testing</code>, type <code>y</code> when asking [<code>No</code>]  
2. create a file called <code>key.property</code>, and add the followings code into it:
```
storePassword=testing
keyPassword=testing
keyAlias=upload
storeFile=D:/Users/user/upload-keystore.jks
```
3. add the following code into <code>android/app/build.gradle</code>:
```
def keystoreProperties = new Properties()
   def keystorePropertiesFile = rootProject.file('key.properties')
   if (keystorePropertiesFile.exists()) {
       keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
   }
```
add the following code in the same file's lintOptions field 
```
lintOptions{
    disable 'InvalidPackage'
    checkReleaseBuilds false
    abortOnError false
}
```
replace the code:
```
buildTypes {
       release {
           signingConfig signingConfigs.debug
       }
   }
```
into
```
signingConfigs {
       release {
           keyAlias keystoreProperties['keyAlias']
           keyPassword keystoreProperties['keyPassword']
           storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
           storePassword keystoreProperties['storePassword']
       }
   }
   buildTypes {
       release {
           signingConfig signingConfigs.release
       }
   }
```
4. download the jdk 11.0.1 and install it in <code>D:\Program Files\Java\jdk-11.0.11</code>
5. find the following comment in android/gradle.properties:
```
org.gradle.jvmargs=-Xmx1536M
```
and replace with:
```
#org.gradle.jvmargs=-Xmx1536M
org.gradle.java.home=D:\\Program Files\\Java\\jdk-11.0.11
```
6. Add the following into <code>android/app/src/main/AndroidManifest.xml</code>,before the <code>Application tag</code>
```
    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-sdk android:minSdkVersion="16" android:targetSdkVersion="30" />
```


### Functions:

1. [Tutorial Documents](#TutorialDocuments)
2. [External App Launcher](#ExternalAppLauncher)
3. [Local Notification](#LocalNotification)
4. [Share Inward](#ShareInward)
5. [Share Outward](#ShareOutward)

### Tutorial Documents

Providing tutorials for following operations:  

+ Renaming the project and the mobile app
+ Changing mobile app icon  


### External App Launcher

### Local Notification

### Share Inward

### Share Outward