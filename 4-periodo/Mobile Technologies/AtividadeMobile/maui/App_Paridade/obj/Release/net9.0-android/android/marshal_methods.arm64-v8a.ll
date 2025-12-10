; ModuleID = 'marshal_methods.arm64-v8a.ll'
source_filename = "marshal_methods.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [112 x ptr] zeroinitializer, align 8

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [336 x i64] [
	i64 u0x0071cf2d27b7d61e, ; 0: lib_Xamarin.AndroidX.SwipeRefreshLayout.dll.so => 68
	i64 u0x02123411c4e01926, ; 1: lib_Xamarin.AndroidX.Navigation.Runtime.dll.so => 64
	i64 u0x02abedc11addc1ed, ; 2: lib_Mono.Android.Runtime.dll.so => 110
	i64 u0x032267b2a94db371, ; 3: lib_Xamarin.AndroidX.AppCompat.dll.so => 47
	i64 u0x043032f1d071fae0, ; 4: ru/Microsoft.Maui.Controls.resources => 24
	i64 u0x044440a55165631e, ; 5: lib-cs-Microsoft.Maui.Controls.resources.dll.so => 2
	i64 u0x046eb1581a80c6b0, ; 6: vi/Microsoft.Maui.Controls.resources => 30
	i64 u0x0517ef04e06e9f76, ; 7: System.Net.Primitives => 93
	i64 u0x0565d18c6da3de38, ; 8: Xamarin.AndroidX.RecyclerView => 66
	i64 u0x0581db89237110e9, ; 9: lib_System.Collections.dll.so => 79
	i64 u0x05989cb940b225a9, ; 10: Microsoft.Maui.dll => 43
	i64 u0x06076b5d2b581f08, ; 11: zh-HK/Microsoft.Maui.Controls.resources => 31
	i64 u0x0680a433c781bb3d, ; 12: Xamarin.AndroidX.Collection.Jvm => 50
	i64 u0x07c57877c7ba78ad, ; 13: ru/Microsoft.Maui.Controls.resources.dll => 24
	i64 u0x07dcdc7460a0c5e4, ; 14: System.Collections.NonGeneric => 77
	i64 u0x08f3c9788ee2153c, ; 15: Xamarin.AndroidX.DrawerLayout => 55
	i64 u0x092266563089ae3e, ; 16: lib_System.Collections.NonGeneric.dll.so => 77
	i64 u0x09d144a7e214d457, ; 17: System.Security.Cryptography => 101
	i64 u0x0b3b632c3bbee20c, ; 18: sk/Microsoft.Maui.Controls.resources => 25
	i64 u0x0b6aff547b84fbe9, ; 19: Xamarin.KotlinX.Serialization.Core.Jvm => 74
	i64 u0x0be2e1f8ce4064ed, ; 20: Xamarin.AndroidX.ViewPager => 69
	i64 u0x0c3ca6cc978e2aae, ; 21: pt-BR/Microsoft.Maui.Controls.resources => 21
	i64 u0x0c59ad9fbbd43abe, ; 22: Mono.Android => 111
	i64 u0x0c7790f60165fc06, ; 23: lib_Microsoft.Maui.Essentials.dll.so => 44
	i64 u0x102a31b45304b1da, ; 24: Xamarin.AndroidX.CustomView => 54
	i64 u0x10f6cfcbcf801616, ; 25: System.IO.Compression.Brotli => 86
	i64 u0x125b7f94acb989db, ; 26: Xamarin.AndroidX.RecyclerView.dll => 66
	i64 u0x13a01de0cbc3f06c, ; 27: lib-fr-Microsoft.Maui.Controls.resources.dll.so => 8
	i64 u0x13f1e5e209e91af4, ; 28: lib_Java.Interop.dll.so => 109
	i64 u0x13f1e880c25d96d1, ; 29: he/Microsoft.Maui.Controls.resources => 9
	i64 u0x143d8ea60a6a4011, ; 30: Microsoft.Extensions.DependencyInjection.Abstractions => 38
	i64 u0x17b56e25558a5d36, ; 31: lib-hu-Microsoft.Maui.Controls.resources.dll.so => 12
	i64 u0x17f9358913beb16a, ; 32: System.Text.Encodings.Web => 102
	i64 u0x18402a709e357f3b, ; 33: lib_Xamarin.KotlinX.Serialization.Core.Jvm.dll.so => 74
	i64 u0x18f0ce884e87d89a, ; 34: nb/Microsoft.Maui.Controls.resources.dll => 18
	i64 u0x1a91866a319e9259, ; 35: lib_System.Collections.Concurrent.dll.so => 76
	i64 u0x1aad60783ffa3e5b, ; 36: lib-th-Microsoft.Maui.Controls.resources.dll.so => 27
	i64 u0x1c753b5ff15bce1b, ; 37: Mono.Android.Runtime.dll => 110
	i64 u0x1e3d87657e9659bc, ; 38: Xamarin.AndroidX.Navigation.UI => 65
	i64 u0x1e71143913d56c10, ; 39: lib-ko-Microsoft.Maui.Controls.resources.dll.so => 16
	i64 u0x209375905fcc1bad, ; 40: lib_System.IO.Compression.Brotli.dll.so => 86
	i64 u0x2174319c0d835bc9, ; 41: System.Runtime => 100
	i64 u0x220fd4f2e7c48170, ; 42: th/Microsoft.Maui.Controls.resources => 27
	i64 u0x2407aef2bbe8fadf, ; 43: System.Console => 83
	i64 u0x240abe014b27e7d3, ; 44: Xamarin.AndroidX.Core.dll => 52
	i64 u0x252073cc3caa62c2, ; 45: fr/Microsoft.Maui.Controls.resources.dll => 8
	i64 u0x2662c629b96b0b30, ; 46: lib_Xamarin.Kotlin.StdLib.dll.so => 72
	i64 u0x268c1439f13bcc29, ; 47: lib_Microsoft.Extensions.Primitives.dll.so => 40
	i64 u0x273f3515de5faf0d, ; 48: id/Microsoft.Maui.Controls.resources.dll => 13
	i64 u0x2742545f9094896d, ; 49: hr/Microsoft.Maui.Controls.resources => 11
	i64 u0x27b410442fad6cf1, ; 50: Java.Interop.dll => 109
	i64 u0x2801845a2c71fbfb, ; 51: System.Net.Primitives.dll => 93
	i64 u0x2a128783efe70ba0, ; 52: uk/Microsoft.Maui.Controls.resources.dll => 29
	i64 u0x2ad156c8e1354139, ; 53: fi/Microsoft.Maui.Controls.resources => 7
	i64 u0x2af298f63581d886, ; 54: System.Text.RegularExpressions.dll => 104
	i64 u0x2afc1c4f898552ee, ; 55: lib_System.Formats.Asn1.dll.so => 85
	i64 u0x2b148910ed40fbf9, ; 56: zh-Hant/Microsoft.Maui.Controls.resources.dll => 33
	i64 u0x2c8bd14bb93a7d82, ; 57: lib-pl-Microsoft.Maui.Controls.resources.dll.so => 20
	i64 u0x2d169d318a968379, ; 58: System.Threading.dll => 105
	i64 u0x2d47774b7d993f59, ; 59: sv/Microsoft.Maui.Controls.resources.dll => 26
	i64 u0x2db915caf23548d2, ; 60: System.Text.Json.dll => 103
	i64 u0x2e6f1f226821322a, ; 61: el/Microsoft.Maui.Controls.resources.dll => 5
	i64 u0x2f2e98e1c89b1aff, ; 62: System.Xml.ReaderWriter => 107
	i64 u0x309ee9eeec09a71e, ; 63: lib_Xamarin.AndroidX.Fragment.dll.so => 56
	i64 u0x31195fef5d8fb552, ; 64: _Microsoft.Android.Resource.Designer.dll => 34
	i64 u0x32243413e774362a, ; 65: Xamarin.AndroidX.CardView.dll => 49
	i64 u0x329753a17a517811, ; 66: fr/Microsoft.Maui.Controls.resources => 8
	i64 u0x32aa989ff07a84ff, ; 67: lib_System.Xml.ReaderWriter.dll.so => 107
	i64 u0x33a31443733849fe, ; 68: lib-es-Microsoft.Maui.Controls.resources.dll.so => 6
	i64 u0x34dfd74fe2afcf37, ; 69: Microsoft.Maui => 43
	i64 u0x34e292762d9615df, ; 70: cs/Microsoft.Maui.Controls.resources.dll => 2
	i64 u0x3508234247f48404, ; 71: Microsoft.Maui.Controls => 41
	i64 u0x3549870798b4cd30, ; 72: lib_Xamarin.AndroidX.ViewPager2.dll.so => 70
	i64 u0x355282fc1c909694, ; 73: Microsoft.Extensions.Configuration => 35
	i64 u0x385c17636bb6fe6e, ; 74: Xamarin.AndroidX.CustomView.dll => 54
	i64 u0x393c226616977fdb, ; 75: lib_Xamarin.AndroidX.ViewPager.dll.so => 69
	i64 u0x395e37c3334cf82a, ; 76: lib-ca-Microsoft.Maui.Controls.resources.dll.so => 1
	i64 u0x3c7c495f58ac5ee9, ; 77: Xamarin.Kotlin.StdLib => 72
	i64 u0x3d9c2a242b040a50, ; 78: lib_Xamarin.AndroidX.Core.dll.so => 52
	i64 u0x407a10bb4bf95829, ; 79: lib_Xamarin.AndroidX.Navigation.Common.dll.so => 62
	i64 u0x41cab042be111c34, ; 80: lib_Xamarin.AndroidX.AppCompat.AppCompatResources.dll.so => 48
	i64 u0x434c4e1d9284cdae, ; 81: Mono.Android.dll => 111
	i64 u0x43950f84de7cc79a, ; 82: pl/Microsoft.Maui.Controls.resources.dll => 20
	i64 u0x4515080865a951a5, ; 83: Xamarin.Kotlin.StdLib.dll => 72
	i64 u0x46a4213bc97fe5ae, ; 84: lib-ru-Microsoft.Maui.Controls.resources.dll.so => 24
	i64 u0x47daf4e1afbada10, ; 85: pt/Microsoft.Maui.Controls.resources => 22
	i64 u0x49e952f19a4e2022, ; 86: System.ObjectModel => 95
	i64 u0x4a5667b2462a664b, ; 87: lib_Xamarin.AndroidX.Navigation.UI.dll.so => 65
	i64 u0x4b7b6532ded934b7, ; 88: System.Text.Json => 103
	i64 u0x4c7755cf07ad2d5f, ; 89: System.Net.Http.Json.dll => 91
	i64 u0x4cc5f15266470798, ; 90: lib_Xamarin.AndroidX.Loader.dll.so => 61
	i64 u0x4d55a010ffc4faff, ; 91: System.Private.Xml => 97
	i64 u0x4dcf44c3c9b076a2, ; 92: it/Microsoft.Maui.Controls.resources.dll => 14
	i64 u0x4dd9247f1d2c3235, ; 93: Xamarin.AndroidX.Loader.dll => 61
	i64 u0x4e32f00cb0937401, ; 94: Mono.Android.Runtime => 110
	i64 u0x4f21ee6ef9eb527e, ; 95: ca/Microsoft.Maui.Controls.resources => 1
	i64 u0x5037f0be3c28c7a3, ; 96: lib_Microsoft.Maui.Controls.dll.so => 41
	i64 u0x5131bbe80989093f, ; 97: Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll => 59
	i64 u0x526ce79eb8e90527, ; 98: lib_System.Net.Primitives.dll.so => 93
	i64 u0x529ffe06f39ab8db, ; 99: Xamarin.AndroidX.Core => 52
	i64 u0x52ff996554dbf352, ; 100: Microsoft.Maui.Graphics => 45
	i64 u0x535f7e40e8fef8af, ; 101: lib-sk-Microsoft.Maui.Controls.resources.dll.so => 25
	i64 u0x53c3014b9437e684, ; 102: lib-zh-HK-Microsoft.Maui.Controls.resources.dll.so => 31
	i64 u0x54795225dd1587af, ; 103: lib_System.Runtime.dll.so => 100
	i64 u0x556e8b63b660ab8b, ; 104: Xamarin.AndroidX.Lifecycle.Common.Jvm.dll => 57
	i64 u0x5588627c9a108ec9, ; 105: System.Collections.Specialized => 78
	i64 u0x571c5cfbec5ae8e2, ; 106: System.Private.Uri => 96
	i64 u0x579a06fed6eec900, ; 107: System.Private.CoreLib.dll => 108
	i64 u0x57c542c14049b66d, ; 108: System.Diagnostics.DiagnosticSource => 84
	i64 u0x58601b2dda4a27b9, ; 109: lib-ja-Microsoft.Maui.Controls.resources.dll.so => 15
	i64 u0x58688d9af496b168, ; 110: Microsoft.Extensions.DependencyInjection.dll => 37
	i64 u0x5a89a886ae30258d, ; 111: lib_Xamarin.AndroidX.CoordinatorLayout.dll.so => 51
	i64 u0x5a8f6699f4a1caa9, ; 112: lib_System.Threading.dll.so => 105
	i64 u0x5ae9cd33b15841bf, ; 113: System.ComponentModel => 82
	i64 u0x5b5f0e240a06a2a2, ; 114: da/Microsoft.Maui.Controls.resources.dll => 3
	i64 u0x5db0cbbd1028510e, ; 115: lib_System.Runtime.InteropServices.dll.so => 98
	i64 u0x5db30905d3e5013b, ; 116: Xamarin.AndroidX.Collection.Jvm.dll => 50
	i64 u0x5e467bc8f09ad026, ; 117: System.Collections.Specialized.dll => 78
	i64 u0x5ea92fdb19ec8c4c, ; 118: System.Text.Encodings.Web.dll => 102
	i64 u0x5eb8046dd40e9ac3, ; 119: System.ComponentModel.Primitives => 80
	i64 u0x5f36ccf5c6a57e24, ; 120: System.Xml.ReaderWriter.dll => 107
	i64 u0x5f9a2d823f664957, ; 121: lib-el-Microsoft.Maui.Controls.resources.dll.so => 5
	i64 u0x609f4b7b63d802d4, ; 122: lib_Microsoft.Extensions.DependencyInjection.dll.so => 37
	i64 u0x60cd4e33d7e60134, ; 123: Xamarin.KotlinX.Coroutines.Core.Jvm => 73
	i64 u0x60f62d786afcf130, ; 124: System.Memory => 90
	i64 u0x61be8d1299194243, ; 125: Microsoft.Maui.Controls.Xaml => 42
	i64 u0x61d2cba29557038f, ; 126: de/Microsoft.Maui.Controls.resources => 4
	i64 u0x622eef6f9e59068d, ; 127: System.Private.CoreLib => 108
	i64 u0x6400f68068c1e9f1, ; 128: Xamarin.Google.Android.Material.dll => 71
	i64 u0x65ecac39144dd3cc, ; 129: Microsoft.Maui.Controls.dll => 41
	i64 u0x65ece51227bfa724, ; 130: lib_System.Runtime.Numerics.dll.so => 99
	i64 u0x6692e924eade1b29, ; 131: lib_System.Console.dll.so => 83
	i64 u0x66a4e5c6a3fb0bae, ; 132: lib_Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll.so => 59
	i64 u0x66d13304ce1a3efa, ; 133: Xamarin.AndroidX.CursorAdapter => 53
	i64 u0x68558ec653afa616, ; 134: lib-da-Microsoft.Maui.Controls.resources.dll.so => 3
	i64 u0x68fbbbe2eb455198, ; 135: System.Formats.Asn1 => 85
	i64 u0x69063fc0ba8e6bdd, ; 136: he/Microsoft.Maui.Controls.resources.dll => 9
	i64 u0x6a4d7577b2317255, ; 137: System.Runtime.InteropServices.dll => 98
	i64 u0x6ace3b74b15ee4a4, ; 138: nb/Microsoft.Maui.Controls.resources => 18
	i64 u0x6d12bfaa99c72b1f, ; 139: lib_Microsoft.Maui.Graphics.dll.so => 45
	i64 u0x6d79993361e10ef2, ; 140: Microsoft.Extensions.Primitives => 40
	i64 u0x6d86d56b84c8eb71, ; 141: lib_Xamarin.AndroidX.CursorAdapter.dll.so => 53
	i64 u0x6d9bea6b3e895cf7, ; 142: Microsoft.Extensions.Primitives.dll => 40
	i64 u0x6e25a02c3833319a, ; 143: lib_Xamarin.AndroidX.Navigation.Fragment.dll.so => 63
	i64 u0x6fd2265da78b93a4, ; 144: lib_Microsoft.Maui.dll.so => 43
	i64 u0x6fdfc7de82c33008, ; 145: cs/Microsoft.Maui.Controls.resources => 2
	i64 u0x70e99f48c05cb921, ; 146: tr/Microsoft.Maui.Controls.resources.dll => 28
	i64 u0x70fd3deda22442d2, ; 147: lib-nb-Microsoft.Maui.Controls.resources.dll.so => 18
	i64 u0x71a495ea3761dde8, ; 148: lib-it-Microsoft.Maui.Controls.resources.dll.so => 14
	i64 u0x71ad672adbe48f35, ; 149: System.ComponentModel.Primitives.dll => 80
	i64 u0x72b1fb4109e08d7b, ; 150: lib-hr-Microsoft.Maui.Controls.resources.dll.so => 11
	i64 u0x73e4ce94e2eb6ffc, ; 151: lib_System.Memory.dll.so => 90
	i64 u0x755a91767330b3d4, ; 152: lib_Microsoft.Extensions.Configuration.dll.so => 35
	i64 u0x76012e7334db86e5, ; 153: lib_Xamarin.AndroidX.SavedState.dll.so => 67
	i64 u0x76ca07b878f44da0, ; 154: System.Runtime.Numerics.dll => 99
	i64 u0x780bc73597a503a9, ; 155: lib-ms-Microsoft.Maui.Controls.resources.dll.so => 17
	i64 u0x783606d1e53e7a1a, ; 156: th/Microsoft.Maui.Controls.resources.dll => 27
	i64 u0x78a45e51311409b6, ; 157: Xamarin.AndroidX.Fragment.dll => 56
	i64 u0x7adb8da2ac89b647, ; 158: fi/Microsoft.Maui.Controls.resources.dll => 7
	i64 u0x7bef86a4335c4870, ; 159: System.ComponentModel.TypeConverter => 81
	i64 u0x7c0820144cd34d6a, ; 160: sk/Microsoft.Maui.Controls.resources.dll => 25
	i64 u0x7c2a0bd1e0f988fc, ; 161: lib-de-Microsoft.Maui.Controls.resources.dll.so => 4
	i64 u0x7d649b75d580bb42, ; 162: ms/Microsoft.Maui.Controls.resources.dll => 17
	i64 u0x7dfc3d6d9d8d7b70, ; 163: System.Collections => 79
	i64 u0x7e946809d6008ef2, ; 164: lib_System.ObjectModel.dll.so => 95
	i64 u0x7ecc13347c8fd849, ; 165: lib_System.ComponentModel.dll.so => 82
	i64 u0x7f00ddd9b9ca5a13, ; 166: Xamarin.AndroidX.ViewPager.dll => 69
	i64 u0x7f9351cd44b1273f, ; 167: Microsoft.Extensions.Configuration.Abstractions => 36
	i64 u0x7fbd557c99b3ce6f, ; 168: lib_Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so => 58
	i64 u0x81ab745f6c0f5ce6, ; 169: zh-Hant/Microsoft.Maui.Controls.resources => 33
	i64 u0x8262ea9b1240b3e5, ; 170: App_Paridade => 75
	i64 u0x8277f2be6b5ce05f, ; 171: Xamarin.AndroidX.AppCompat => 47
	i64 u0x828f06563b30bc50, ; 172: lib_Xamarin.AndroidX.CardView.dll.so => 49
	i64 u0x82f6403342e12049, ; 173: uk/Microsoft.Maui.Controls.resources => 29
	i64 u0x83c14ba66c8e2b8c, ; 174: zh-Hans/Microsoft.Maui.Controls.resources => 32
	i64 u0x86a909228dc7657b, ; 175: lib-zh-Hant-Microsoft.Maui.Controls.resources.dll.so => 33
	i64 u0x86b3e00c36b84509, ; 176: Microsoft.Extensions.Configuration.dll => 35
	i64 u0x87f6569b25707834, ; 177: System.IO.Compression.Brotli.dll => 86
	i64 u0x8842b3a5d2d3fb36, ; 178: Microsoft.Maui.Essentials => 44
	i64 u0x88bda98e0cffb7a9, ; 179: lib_Xamarin.KotlinX.Coroutines.Core.Jvm.dll.so => 73
	i64 u0x897a606c9e39c75f, ; 180: lib_System.ComponentModel.Primitives.dll.so => 80
	i64 u0x8ad229ea26432ee2, ; 181: Xamarin.AndroidX.Loader => 61
	i64 u0x8b4ff5d0fdd5faa1, ; 182: lib_System.Diagnostics.DiagnosticSource.dll.so => 84
	i64 u0x8b9ceca7acae3451, ; 183: lib-he-Microsoft.Maui.Controls.resources.dll.so => 9
	i64 u0x8d0f420977c2c1c7, ; 184: Xamarin.AndroidX.CursorAdapter.dll => 53
	i64 u0x8d7b8ab4b3310ead, ; 185: System.Threading => 105
	i64 u0x8da188285aadfe8e, ; 186: System.Collections.Concurrent => 76
	i64 u0x8ed807bfe9858dfc, ; 187: Xamarin.AndroidX.Navigation.Common => 62
	i64 u0x8ee08b8194a30f48, ; 188: lib-hi-Microsoft.Maui.Controls.resources.dll.so => 10
	i64 u0x8ef7601039857a44, ; 189: lib-ro-Microsoft.Maui.Controls.resources.dll.so => 23
	i64 u0x8f32c6f611f6ffab, ; 190: pt/Microsoft.Maui.Controls.resources.dll => 22
	i64 u0x8f8829d21c8985a4, ; 191: lib-pt-BR-Microsoft.Maui.Controls.resources.dll.so => 21
	i64 u0x903101b46fb73a04, ; 192: _Microsoft.Android.Resource.Designer => 34
	i64 u0x90393bd4865292f3, ; 193: lib_System.IO.Compression.dll.so => 87
	i64 u0x90634f86c5ebe2b5, ; 194: Xamarin.AndroidX.Lifecycle.ViewModel.Android => 59
	i64 u0x907b636704ad79ef, ; 195: lib_Microsoft.Maui.Controls.Xaml.dll.so => 42
	i64 u0x91418dc638b29e68, ; 196: lib_Xamarin.AndroidX.CustomView.dll.so => 54
	i64 u0x9157bd523cd7ed36, ; 197: lib_System.Text.Json.dll.so => 103
	i64 u0x91a74f07b30d37e2, ; 198: System.Linq.dll => 89
	i64 u0x91fa41a87223399f, ; 199: ca/Microsoft.Maui.Controls.resources.dll => 1
	i64 u0x93cfa73ab28d6e35, ; 200: ms/Microsoft.Maui.Controls.resources => 17
	i64 u0x944077d8ca3c6580, ; 201: System.IO.Compression.dll => 87
	i64 u0x967fc325e09bfa8c, ; 202: es/Microsoft.Maui.Controls.resources => 6
	i64 u0x9732d8dbddea3d9a, ; 203: id/Microsoft.Maui.Controls.resources => 13
	i64 u0x978be80e5210d31b, ; 204: Microsoft.Maui.Graphics.dll => 45
	i64 u0x97b8c771ea3e4220, ; 205: System.ComponentModel.dll => 82
	i64 u0x97e144c9d3c6976e, ; 206: System.Collections.Concurrent.dll => 76
	i64 u0x99a00ca5270c6878, ; 207: Xamarin.AndroidX.Navigation.Runtime => 64
	i64 u0x99cdc6d1f2d3a72f, ; 208: ko/Microsoft.Maui.Controls.resources.dll => 16
	i64 u0x9d5dbcf5a48583fe, ; 209: lib_Xamarin.AndroidX.Activity.dll.so => 46
	i64 u0x9d74dee1a7725f34, ; 210: Microsoft.Extensions.Configuration.Abstractions.dll => 36
	i64 u0x9e4534b6adaf6e84, ; 211: nl/Microsoft.Maui.Controls.resources => 19
	i64 u0x9eaf1efdf6f7267e, ; 212: Xamarin.AndroidX.Navigation.Common.dll => 62
	i64 u0x9ef542cf1f78c506, ; 213: Xamarin.AndroidX.Lifecycle.LiveData.Core => 58
	i64 u0xa0d8259f4cc284ec, ; 214: lib_System.Security.Cryptography.dll.so => 101
	i64 u0xa1440773ee9d341e, ; 215: Xamarin.Google.Android.Material => 71
	i64 u0xa1b9d7c27f47219f, ; 216: Xamarin.AndroidX.Navigation.UI.dll => 65
	i64 u0xa2572680829d2c7c, ; 217: System.IO.Pipelines.dll => 88
	i64 u0xa2f5ad80ca9052df, ; 218: lib_App_Paridade.dll.so => 75
	i64 u0xa46aa1eaa214539b, ; 219: ko/Microsoft.Maui.Controls.resources => 16
	i64 u0xa5f1ba49b85dd355, ; 220: System.Security.Cryptography.dll => 101
	i64 u0xa67dbee13e1df9ca, ; 221: Xamarin.AndroidX.SavedState.dll => 67
	i64 u0xa68a420042bb9b1f, ; 222: Xamarin.AndroidX.DrawerLayout.dll => 55
	i64 u0xa78ce3745383236a, ; 223: Xamarin.AndroidX.Lifecycle.Common.Jvm => 57
	i64 u0xa7c31b56b4dc7b33, ; 224: hu/Microsoft.Maui.Controls.resources => 12
	i64 u0xa9852d8e685a5810, ; 225: App_Paridade.dll => 75
	i64 u0xaa2219c8e3449ff5, ; 226: Microsoft.Extensions.Logging.Abstractions => 39
	i64 u0xaa443ac34067eeef, ; 227: System.Private.Xml.dll => 97
	i64 u0xaa52de307ef5d1dd, ; 228: System.Net.Http => 92
	i64 u0xaaaf86367285a918, ; 229: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 38
	i64 u0xaaf84bb3f052a265, ; 230: el/Microsoft.Maui.Controls.resources => 5
	i64 u0xac2af3fa195a15ce, ; 231: System.Runtime.Numerics => 99
	i64 u0xac5376a2a538dc10, ; 232: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 58
	i64 u0xacd46e002c3ccb97, ; 233: ro/Microsoft.Maui.Controls.resources => 23
	i64 u0xad89c07347f1bad6, ; 234: nl/Microsoft.Maui.Controls.resources.dll => 19
	i64 u0xadbb53caf78a79d2, ; 235: System.Web.HttpUtility => 106
	i64 u0xadc90ab061a9e6e4, ; 236: System.ComponentModel.TypeConverter.dll => 81
	i64 u0xae282bcd03739de7, ; 237: Java.Interop => 109
	i64 u0xae53579c90db1107, ; 238: System.ObjectModel.dll => 95
	i64 u0xafe29f45095518e7, ; 239: lib_Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll.so => 60
	i64 u0xb05cc42cd94c6d9d, ; 240: lib-sv-Microsoft.Maui.Controls.resources.dll.so => 26
	i64 u0xb220631954820169, ; 241: System.Text.RegularExpressions => 104
	i64 u0xb2a3f67f3bf29fce, ; 242: da/Microsoft.Maui.Controls.resources => 3
	i64 u0xb3f0a0fcda8d3ebc, ; 243: Xamarin.AndroidX.CardView => 49
	i64 u0xb46be1aa6d4fff93, ; 244: hi/Microsoft.Maui.Controls.resources => 10
	i64 u0xb477491be13109d8, ; 245: ar/Microsoft.Maui.Controls.resources => 0
	i64 u0xb4bd7015ecee9d86, ; 246: System.IO.Pipelines => 88
	i64 u0xb5c7fcdafbc67ee4, ; 247: Microsoft.Extensions.Logging.Abstractions.dll => 39
	i64 u0xb7b7753d1f319409, ; 248: sv/Microsoft.Maui.Controls.resources => 26
	i64 u0xb81a2c6e0aee50fe, ; 249: lib_System.Private.CoreLib.dll.so => 108
	i64 u0xb9f64d3b230def68, ; 250: lib-pt-Microsoft.Maui.Controls.resources.dll.so => 22
	i64 u0xb9fc3c8a556e3691, ; 251: ja/Microsoft.Maui.Controls.resources => 15
	i64 u0xba48785529705af9, ; 252: System.Collections.dll => 79
	i64 u0xbd0e2c0d55246576, ; 253: System.Net.Http.dll => 92
	i64 u0xbd437a2cdb333d0d, ; 254: Xamarin.AndroidX.ViewPager2 => 70
	i64 u0xbee38d4a88835966, ; 255: Xamarin.AndroidX.AppCompat.AppCompatResources => 48
	i64 u0xbfc1e1fb3095f2b3, ; 256: lib_System.Net.Http.Json.dll.so => 91
	i64 u0xc040a4ab55817f58, ; 257: ar/Microsoft.Maui.Controls.resources.dll => 0
	i64 u0xc0d928351ab5ca77, ; 258: System.Console.dll => 83
	i64 u0xc12b8b3afa48329c, ; 259: lib_System.Linq.dll.so => 89
	i64 u0xc1ff9ae3cdb6e1e6, ; 260: Xamarin.AndroidX.Activity.dll => 46
	i64 u0xc28c50f32f81cc73, ; 261: ja/Microsoft.Maui.Controls.resources.dll => 15
	i64 u0xc2bcfec99f69365e, ; 262: Xamarin.AndroidX.ViewPager2.dll => 70
	i64 u0xc4d3858ed4d08512, ; 263: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 60
	i64 u0xc50fded0ded1418c, ; 264: lib_System.ComponentModel.TypeConverter.dll.so => 81
	i64 u0xc519125d6bc8fb11, ; 265: lib_System.Net.Requests.dll.so => 94
	i64 u0xc5293b19e4dc230e, ; 266: Xamarin.AndroidX.Navigation.Fragment => 63
	i64 u0xc5325b2fcb37446f, ; 267: lib_System.Private.Xml.dll.so => 97
	i64 u0xc5a0f4b95a699af7, ; 268: lib_System.Private.Uri.dll.so => 96
	i64 u0xc7ce851898a4548e, ; 269: lib_System.Web.HttpUtility.dll.so => 106
	i64 u0xc858a28d9ee5a6c5, ; 270: lib_System.Collections.Specialized.dll.so => 78
	i64 u0xca3a723e7342c5b6, ; 271: lib-tr-Microsoft.Maui.Controls.resources.dll.so => 28
	i64 u0xcab3493c70141c2d, ; 272: pl/Microsoft.Maui.Controls.resources => 20
	i64 u0xcacfddc9f7c6de76, ; 273: ro/Microsoft.Maui.Controls.resources.dll => 23
	i64 u0xcbd4fdd9cef4a294, ; 274: lib__Microsoft.Android.Resource.Designer.dll.so => 34
	i64 u0xcc2876b32ef2794c, ; 275: lib_System.Text.RegularExpressions.dll.so => 104
	i64 u0xcc5c3bb714c4561e, ; 276: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 73
	i64 u0xcc76886e09b88260, ; 277: Xamarin.KotlinX.Serialization.Core.Jvm.dll => 74
	i64 u0xccf25c4b634ccd3a, ; 278: zh-Hans/Microsoft.Maui.Controls.resources.dll => 32
	i64 u0xcd10a42808629144, ; 279: System.Net.Requests => 94
	i64 u0xcdd0c48b6937b21c, ; 280: Xamarin.AndroidX.SwipeRefreshLayout => 68
	i64 u0xcf23d8093f3ceadf, ; 281: System.Diagnostics.DiagnosticSource.dll => 84
	i64 u0xd1194e1d8a8de83c, ; 282: lib_Xamarin.AndroidX.Lifecycle.Common.Jvm.dll.so => 57
	i64 u0xd333d0af9e423810, ; 283: System.Runtime.InteropServices => 98
	i64 u0xd3426d966bb704f5, ; 284: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 48
	i64 u0xd3651b6fc3125825, ; 285: System.Private.Uri.dll => 96
	i64 u0xd3e4c8d6a2d5d470, ; 286: it/Microsoft.Maui.Controls.resources => 14
	i64 u0xd4645626dffec99d, ; 287: lib_Microsoft.Extensions.DependencyInjection.Abstractions.dll.so => 38
	i64 u0xd5507e11a2b2839f, ; 288: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 60
	i64 u0xd6694f8359737e4e, ; 289: Xamarin.AndroidX.SavedState => 67
	i64 u0xd6d21782156bc35b, ; 290: Xamarin.AndroidX.SwipeRefreshLayout.dll => 68
	i64 u0xd72329819cbbbc44, ; 291: lib_Microsoft.Extensions.Configuration.Abstractions.dll.so => 36
	i64 u0xd7b3764ada9d341d, ; 292: lib_Microsoft.Extensions.Logging.Abstractions.dll.so => 39
	i64 u0xda1dfa4c534a9251, ; 293: Microsoft.Extensions.DependencyInjection => 37
	i64 u0xdad05a11827959a3, ; 294: System.Collections.NonGeneric.dll => 77
	i64 u0xdb5383ab5865c007, ; 295: lib-vi-Microsoft.Maui.Controls.resources.dll.so => 30
	i64 u0xdbeda89f832aa805, ; 296: vi/Microsoft.Maui.Controls.resources.dll => 30
	i64 u0xdbf9607a441b4505, ; 297: System.Linq => 89
	i64 u0xdd2b722d78ef5f43, ; 298: System.Runtime.dll => 100
	i64 u0xdd67031857c72f96, ; 299: lib_System.Text.Encodings.Web.dll.so => 102
	i64 u0xdde30e6b77aa6f6c, ; 300: lib-zh-Hans-Microsoft.Maui.Controls.resources.dll.so => 32
	i64 u0xde8769ebda7d8647, ; 301: hr/Microsoft.Maui.Controls.resources.dll => 11
	i64 u0xe0142572c095a480, ; 302: Xamarin.AndroidX.AppCompat.dll => 47
	i64 u0xe02f89350ec78051, ; 303: Xamarin.AndroidX.CoordinatorLayout.dll => 51
	i64 u0xe192a588d4410686, ; 304: lib_System.IO.Pipelines.dll.so => 88
	i64 u0xe2420585aeceb728, ; 305: System.Net.Requests.dll => 94
	i64 u0xe29b73bc11392966, ; 306: lib-id-Microsoft.Maui.Controls.resources.dll.so => 13
	i64 u0xe3811d68d4fe8463, ; 307: pt-BR/Microsoft.Maui.Controls.resources.dll => 21
	i64 u0xe494f7ced4ecd10a, ; 308: hu/Microsoft.Maui.Controls.resources.dll => 12
	i64 u0xe4a9b1e40d1e8917, ; 309: lib-fi-Microsoft.Maui.Controls.resources.dll.so => 7
	i64 u0xe5434e8a119ceb69, ; 310: lib_Mono.Android.dll.so => 111
	i64 u0xedc632067fb20ff3, ; 311: System.Memory.dll => 90
	i64 u0xedc8e4ca71a02a8b, ; 312: Xamarin.AndroidX.Navigation.Runtime.dll => 64
	i64 u0xeeb7ebb80150501b, ; 313: lib_Xamarin.AndroidX.Collection.Jvm.dll.so => 50
	i64 u0xef72742e1bcca27a, ; 314: Microsoft.Maui.Essentials.dll => 44
	i64 u0xefec0b7fdc57ec42, ; 315: Xamarin.AndroidX.Activity => 46
	i64 u0xf00c29406ea45e19, ; 316: es/Microsoft.Maui.Controls.resources.dll => 6
	i64 u0xf11b621fc87b983f, ; 317: Microsoft.Maui.Controls.Xaml.dll => 42
	i64 u0xf1c4b4005493d871, ; 318: System.Formats.Asn1.dll => 85
	i64 u0xf238bd79489d3a96, ; 319: lib-nl-Microsoft.Maui.Controls.resources.dll.so => 19
	i64 u0xf37221fda4ef8830, ; 320: lib_Xamarin.Google.Android.Material.dll.so => 71
	i64 u0xf4c1dd70a5496a17, ; 321: System.IO.Compression => 87
	i64 u0xf6077741019d7428, ; 322: Xamarin.AndroidX.CoordinatorLayout => 51
	i64 u0xf77b20923f07c667, ; 323: de/Microsoft.Maui.Controls.resources.dll => 4
	i64 u0xf7e74930e0e3d214, ; 324: zh-HK/Microsoft.Maui.Controls.resources.dll => 31
	i64 u0xf84773b5c81e3cef, ; 325: lib-uk-Microsoft.Maui.Controls.resources.dll.so => 29
	i64 u0xf8e045dc345b2ea3, ; 326: lib_Xamarin.AndroidX.RecyclerView.dll.so => 66
	i64 u0xf915dc29808193a1, ; 327: System.Web.HttpUtility.dll => 106
	i64 u0xf96c777a2a0686f4, ; 328: hi/Microsoft.Maui.Controls.resources.dll => 10
	i64 u0xfa5ed7226d978949, ; 329: lib-ar-Microsoft.Maui.Controls.resources.dll.so => 0
	i64 u0xfbf0a31c9fc34bc4, ; 330: lib_System.Net.Http.dll.so => 92
	i64 u0xfc719aec26adf9d9, ; 331: Xamarin.AndroidX.Navigation.Fragment.dll => 63
	i64 u0xfd22f00870e40ae0, ; 332: lib_Xamarin.AndroidX.DrawerLayout.dll.so => 55
	i64 u0xfd583f7657b6a1cb, ; 333: Xamarin.AndroidX.Fragment => 56
	i64 u0xfeae9952cf03b8cb, ; 334: tr/Microsoft.Maui.Controls.resources => 28
	i64 u0xff9b54613e0d2cc8 ; 335: System.Net.Http.Json => 91
], align 8

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [336 x i32] [
	i32 68, i32 64, i32 110, i32 47, i32 24, i32 2, i32 30, i32 93,
	i32 66, i32 79, i32 43, i32 31, i32 50, i32 24, i32 77, i32 55,
	i32 77, i32 101, i32 25, i32 74, i32 69, i32 21, i32 111, i32 44,
	i32 54, i32 86, i32 66, i32 8, i32 109, i32 9, i32 38, i32 12,
	i32 102, i32 74, i32 18, i32 76, i32 27, i32 110, i32 65, i32 16,
	i32 86, i32 100, i32 27, i32 83, i32 52, i32 8, i32 72, i32 40,
	i32 13, i32 11, i32 109, i32 93, i32 29, i32 7, i32 104, i32 85,
	i32 33, i32 20, i32 105, i32 26, i32 103, i32 5, i32 107, i32 56,
	i32 34, i32 49, i32 8, i32 107, i32 6, i32 43, i32 2, i32 41,
	i32 70, i32 35, i32 54, i32 69, i32 1, i32 72, i32 52, i32 62,
	i32 48, i32 111, i32 20, i32 72, i32 24, i32 22, i32 95, i32 65,
	i32 103, i32 91, i32 61, i32 97, i32 14, i32 61, i32 110, i32 1,
	i32 41, i32 59, i32 93, i32 52, i32 45, i32 25, i32 31, i32 100,
	i32 57, i32 78, i32 96, i32 108, i32 84, i32 15, i32 37, i32 51,
	i32 105, i32 82, i32 3, i32 98, i32 50, i32 78, i32 102, i32 80,
	i32 107, i32 5, i32 37, i32 73, i32 90, i32 42, i32 4, i32 108,
	i32 71, i32 41, i32 99, i32 83, i32 59, i32 53, i32 3, i32 85,
	i32 9, i32 98, i32 18, i32 45, i32 40, i32 53, i32 40, i32 63,
	i32 43, i32 2, i32 28, i32 18, i32 14, i32 80, i32 11, i32 90,
	i32 35, i32 67, i32 99, i32 17, i32 27, i32 56, i32 7, i32 81,
	i32 25, i32 4, i32 17, i32 79, i32 95, i32 82, i32 69, i32 36,
	i32 58, i32 33, i32 75, i32 47, i32 49, i32 29, i32 32, i32 33,
	i32 35, i32 86, i32 44, i32 73, i32 80, i32 61, i32 84, i32 9,
	i32 53, i32 105, i32 76, i32 62, i32 10, i32 23, i32 22, i32 21,
	i32 34, i32 87, i32 59, i32 42, i32 54, i32 103, i32 89, i32 1,
	i32 17, i32 87, i32 6, i32 13, i32 45, i32 82, i32 76, i32 64,
	i32 16, i32 46, i32 36, i32 19, i32 62, i32 58, i32 101, i32 71,
	i32 65, i32 88, i32 75, i32 16, i32 101, i32 67, i32 55, i32 57,
	i32 12, i32 75, i32 39, i32 97, i32 92, i32 38, i32 5, i32 99,
	i32 58, i32 23, i32 19, i32 106, i32 81, i32 109, i32 95, i32 60,
	i32 26, i32 104, i32 3, i32 49, i32 10, i32 0, i32 88, i32 39,
	i32 26, i32 108, i32 22, i32 15, i32 79, i32 92, i32 70, i32 48,
	i32 91, i32 0, i32 83, i32 89, i32 46, i32 15, i32 70, i32 60,
	i32 81, i32 94, i32 63, i32 97, i32 96, i32 106, i32 78, i32 28,
	i32 20, i32 23, i32 34, i32 104, i32 73, i32 74, i32 32, i32 94,
	i32 68, i32 84, i32 57, i32 98, i32 48, i32 96, i32 14, i32 38,
	i32 60, i32 67, i32 68, i32 36, i32 39, i32 37, i32 77, i32 30,
	i32 30, i32 89, i32 100, i32 102, i32 32, i32 11, i32 47, i32 51,
	i32 88, i32 94, i32 13, i32 21, i32 12, i32 7, i32 111, i32 90,
	i32 64, i32 50, i32 44, i32 46, i32 6, i32 42, i32 85, i32 19,
	i32 71, i32 87, i32 51, i32 4, i32 31, i32 29, i32 66, i32 106,
	i32 10, i32 0, i32 92, i32 63, i32 55, i32 56, i32 28, i32 91
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 u0x0000000000000000, ; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

; Functions

; Function attributes: memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" }

; Metadata
!llvm.module.flags = !{!0, !1, !7, !8, !9, !10}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!".NET for Android remotes/origin/release/9.0.1xx @ 9abff7703206541fdb83ffa80fe2c2753ad1997b"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
