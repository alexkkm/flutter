package com.alexkkm.flutter

import android.content.ContentResolver
import android.content.Context
import android.content.Intent
import android.media.RingtoneManager
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.util.*

class MainActivity : FlutterActivity() {
  private var sharedData: String = ""

  override fun onCreate(
    savedInstanceState: Bundle?
  ) {
    super.onCreate(savedInstanceState)
    handleIntent()
  }

  override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)
    MethodChannel(flutterEngine.dartExecutor.binaryMessenger,
            "com.alexkkm.flutter").setMethodCallHandler { call, result ->
              if (call.method == "getSharedData") {
                handleIntent()
                result.success(sharedData)
                sharedData = ""
              }
              if ("drawableToUri" == call.method) {
                val resourceId = this@MainActivity.resources.getIdentifier(call.arguments as String, "drawable", this@MainActivity.packageName)
                result.success(resourceToUriString(this@MainActivity.applicationContext, resourceId))
            }
              if ("getAlarmUri" == call.method) {
                result.success(RingtoneManager.getDefaultUri(RingtoneManager.TYPE_ALARM).toString())
            }
            }
  }


  private fun handleIntent() {
    // intent is a property of this activity
    // Only process the intent if it's a send intent and it's of type 'text'
    if (intent?.action == Intent.ACTION_SEND) {
      if (intent.type == "text/plain") {
        intent.getStringExtra(Intent.EXTRA_TEXT)?.let { intentData ->
          sharedData = intentData
        }
      }
    }
  }

  private fun resourceToUriString(context: Context, resId: Int): String? {
        return (ContentResolver.SCHEME_ANDROID_RESOURCE + "://"
                + context.resources.getResourcePackageName(resId)
                + "/"
                + context.resources.getResourceTypeName(resId)
                + "/"
                + context.resources.getResourceEntryName(resId))
    }
    
}
