# Flutter specific rules
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugins.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.embedding.** { *; }
-keep class io.flutter.embedding.engine.** { *; }
-keep class io.flutter.embedding.engine.plugins.** { *; }
-keep class io.flutter.embedding.engine.plugins.shim.** { *; }
-keep class io.flutter.embedding.engine.systemchannels.** { *; }
-keep class io.flutter.plugin.platform.PlatformPlugin { *; }

# Firebase specific rules
-keep class com.google.firebase.** { *; }
-keep class com.google.android.gms.** { *; }
-keep class io.flutter.plugins.firebase.** { *; }

# Retrofit (if used) specific rules
-keep class retrofit2.** { *; }
-keep class okhttp3.** { *; }
-dontwarn retrofit2.**
-dontwarn okhttp3.**

# GSON (if used) specific rules
-keep class com.google.gson.** { *; }
-dontwarn com.google.gson.**

# General rules to keep all annotations and public methods
-keepattributes *Annotation*
-keep class * {
    @com.google.gson.annotations.SerializedName <fields>;
}

# Keep public classes and methods in your own package
-keep public class com.example.yourpackage.** { public *; }
