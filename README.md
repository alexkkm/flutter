# Flutter

A personal Flutter App for saving the progress and flutter learning process.

---
1. [Essential Setting after clonning the repo into your own device](#essential-setting-after-clonning-the-repo-into-your-own-device)
2. [Settings for running release mode](#settings-for-running-release-mode)
3. [Functions](#functions)
4. [Tutorial Documents](#tutorial-documents)
5. [External App Launcher](#external-app-launcher)
6. [Local Notification](#local-notification)
7. [Share Inward](#share-inward)
8. [Share Outward](#share-outward)
9. [Local Storage](#local-storage)
10. [To Do List](#to-do-list)
11. [Authentication](#authentication)
12. [Google Signin](#google-signin)
---
### Essential Setting after clonning the repo into your own device:
1. Open the file at the location: android/gradle.properties
2. In the line: <code> org.gradle.java.home=D:\\Program Files\\Java\\jdk-11.0.11 </code>, change the <code> D:\\Program Files\\Java\\jdk-11.0.11 </code> into the location of your own Java Jdk  
(Note that the version of Java jdk should lower then 12)
---

### Settings for running release mode:
1. run the following code in terminal:
```temrinal
keytool -genkey -v -keystore D:\Users\user\upload-keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias upload
```
NOTE: <code>D:\Users\user\upload-keystore.jks</code> should be changed according to your computer user name  
and set the password as <code>password</code>, type <code>y</code> when asking [<code>No</code>]  

NOTE: To get the SHA01 and SHA256 key, please type the below code in terminal:
```
keytool -alias upload -keystore D:\Users\user\.android.debug.keystore -list -v
```

2. create a file called <code>key.property</code>, and add the followings code into it:
```
storePassword=testing
keyPassword=testing
keyAlias=upload
storeFile=D:/Users/user/upload-keystore.jks
```
NOTE: <code>D:\Users\user\upload-keystore.jks</code> should be changed according to your computer user name  

3. add the following code into <code>android/app/build.gradle</code>:
```
def keystoreProperties = new Properties()
   def keystorePropertiesFile = rootProject.file('key.properties')
   if (keystorePropertiesFile.exists()) {
       keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
   }
```
add the following code in the same file's Android field  
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
4. Add the following into <code>android/app/src/main/AndroidManifest.xml</code>,before the <code>Application tag</code>  
```
    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-sdk android:minSdkVersion="16" android:targetSdkVersion="30" />
```
5. download the jdk 11.0.1 and install it in <code>D:\Program Files\Java\jdk-11.0.11</code>  
6. find the following comment in android/gradle.properties:  
```
org.gradle.jvmargs=-Xmx1536M
```
and replace with:  
```
#org.gradle.jvmargs=-Xmx1536M
org.gradle.java.home=D:\\Program Files\\Java\\jdk-11.0.11
```
NOTE: In gradle.properties:<code>org.gradle.java.home</code> path should be change according to the path you install jdk 11.0.11 in last steps  
NOTE: gradle.properties should not be add into gitignore, all other files generate above can be gitignore, and generate when need to build release apk

---
### Functions:

1. [Tutorial Documents](#TutorialDocuments)
2. [External App Launcher](#ExternalAppLauncher)
3. [Local Notification](#LocalNotification)
4. [Share Inward](#ShareInward)
5. [Share Outward](#ShareOutward)

---
### Tutorial Documents

Providing tutorials for following operations:  
+ Renaming the project and the mobile app
+ Changing mobile app icon  


### External App Launcher

### Local Notification

### Share Inward

### Share Outward

### Local Storage

### To Do List

### Authentication

### Google Signin
