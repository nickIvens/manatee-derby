package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Future;
import lime.app.Preloader;
import lime.app.Promise;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.text.Font;
import lime.utils.ByteArray;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if (js && html5)
import lime.net.URLLoader;
import lime.net.URLRequest;
#elseif flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if (openfl && !flash)
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		#end
		
		#if flash
		
		className.set ("img/arrowL.png", __ASSET__img_arrowl_png);
		type.set ("img/arrowL.png", AssetType.IMAGE);
		className.set ("img/arrowR.png", __ASSET__img_arrowr_png);
		type.set ("img/arrowR.png", AssetType.IMAGE);
		className.set ("img/btn_back.png", __ASSET__img_btn_back_png);
		type.set ("img/btn_back.png", AssetType.IMAGE);
		className.set ("img/btn_bet.png", __ASSET__img_btn_bet_png);
		type.set ("img/btn_bet.png", AssetType.IMAGE);
		className.set ("img/btn_buy.png", __ASSET__img_btn_buy_png);
		type.set ("img/btn_buy.png", AssetType.IMAGE);
		className.set ("img/btn_mart.png", __ASSET__img_btn_mart_png);
		type.set ("img/btn_mart.png", AssetType.IMAGE);
		className.set ("img/btn_races.png", __ASSET__img_btn_races_png);
		type.set ("img/btn_races.png", AssetType.IMAGE);
		className.set ("img/btn_ranch.png", __ASSET__img_btn_ranch_png);
		type.set ("img/btn_ranch.png", AssetType.IMAGE);
		className.set ("img/btn_watch.png", __ASSET__img_btn_watch_png);
		type.set ("img/btn_watch.png", AssetType.IMAGE);
		className.set ("img/confirmbuy_bg.png", __ASSET__img_confirmbuy_bg_png);
		type.set ("img/confirmbuy_bg.png", AssetType.IMAGE);
		className.set ("img/manatee.png", __ASSET__img_manatee_png);
		type.set ("img/manatee.png", AssetType.IMAGE);
		className.set ("img/manatee1.png", __ASSET__img_manatee1_png);
		type.set ("img/manatee1.png", AssetType.IMAGE);
		className.set ("img/manatee2.png", __ASSET__img_manatee2_png);
		type.set ("img/manatee2.png", AssetType.IMAGE);
		className.set ("img/manatee3.png", __ASSET__img_manatee3_png);
		type.set ("img/manatee3.png", AssetType.IMAGE);
		className.set ("img/manatee4.png", __ASSET__img_manatee4_png);
		type.set ("img/manatee4.png", AssetType.IMAGE);
		className.set ("img/mart_bg.png", __ASSET__img_mart_bg_png);
		type.set ("img/mart_bg.png", AssetType.IMAGE);
		className.set ("img/menu_bg.png", __ASSET__img_menu_bg_png);
		type.set ("img/menu_bg.png", AssetType.IMAGE);
		className.set ("img/placebet_bg.png", __ASSET__img_placebet_bg_png);
		type.set ("img/placebet_bg.png", AssetType.IMAGE);
		className.set ("img/racecard_bg.png", __ASSET__img_racecard_bg_png);
		type.set ("img/racecard_bg.png", AssetType.IMAGE);
		className.set ("img/raceover_bg.png", __ASSET__img_raceover_bg_png);
		type.set ("img/raceover_bg.png", AssetType.IMAGE);
		className.set ("img/races_bg.png", __ASSET__img_races_bg_png);
		type.set ("img/races_bg.png", AssetType.IMAGE);
		className.set ("img/ranch_bg.png", __ASSET__img_ranch_bg_png);
		type.set ("img/ranch_bg.png", AssetType.IMAGE);
		className.set ("img/title_bg.png", __ASSET__img_title_bg_png);
		type.set ("img/title_bg.png", AssetType.IMAGE);
		className.set ("sound/title_bg.ogg", __ASSET__sound_title_bg_ogg);
		type.set ("sound/title_bg.ogg", AssetType.MUSIC);
		
		
		#elseif html5
		
		var id;
		id = "img/arrowL.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/arrowR.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/btn_back.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/btn_bet.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/btn_buy.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/btn_mart.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/btn_races.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/btn_ranch.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/btn_watch.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/confirmbuy_bg.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/manatee.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/manatee1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/manatee2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/manatee3.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/manatee4.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/mart_bg.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/menu_bg.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/placebet_bg.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/racecard_bg.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/raceover_bg.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/races_bg.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/ranch_bg.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "img/title_bg.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "sound/title_bg.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		
		
		var assetsPrefix = null;
		if (ApplicationMain.config != null && Reflect.hasField (ApplicationMain.config, "assetsPrefix")) {
			assetsPrefix = ApplicationMain.config.assetsPrefix;
		}
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("img/arrowL.png", __ASSET__img_arrowl_png);
		type.set ("img/arrowL.png", AssetType.IMAGE);
		
		className.set ("img/arrowR.png", __ASSET__img_arrowr_png);
		type.set ("img/arrowR.png", AssetType.IMAGE);
		
		className.set ("img/btn_back.png", __ASSET__img_btn_back_png);
		type.set ("img/btn_back.png", AssetType.IMAGE);
		
		className.set ("img/btn_bet.png", __ASSET__img_btn_bet_png);
		type.set ("img/btn_bet.png", AssetType.IMAGE);
		
		className.set ("img/btn_buy.png", __ASSET__img_btn_buy_png);
		type.set ("img/btn_buy.png", AssetType.IMAGE);
		
		className.set ("img/btn_mart.png", __ASSET__img_btn_mart_png);
		type.set ("img/btn_mart.png", AssetType.IMAGE);
		
		className.set ("img/btn_races.png", __ASSET__img_btn_races_png);
		type.set ("img/btn_races.png", AssetType.IMAGE);
		
		className.set ("img/btn_ranch.png", __ASSET__img_btn_ranch_png);
		type.set ("img/btn_ranch.png", AssetType.IMAGE);
		
		className.set ("img/btn_watch.png", __ASSET__img_btn_watch_png);
		type.set ("img/btn_watch.png", AssetType.IMAGE);
		
		className.set ("img/confirmbuy_bg.png", __ASSET__img_confirmbuy_bg_png);
		type.set ("img/confirmbuy_bg.png", AssetType.IMAGE);
		
		className.set ("img/manatee.png", __ASSET__img_manatee_png);
		type.set ("img/manatee.png", AssetType.IMAGE);
		
		className.set ("img/manatee1.png", __ASSET__img_manatee1_png);
		type.set ("img/manatee1.png", AssetType.IMAGE);
		
		className.set ("img/manatee2.png", __ASSET__img_manatee2_png);
		type.set ("img/manatee2.png", AssetType.IMAGE);
		
		className.set ("img/manatee3.png", __ASSET__img_manatee3_png);
		type.set ("img/manatee3.png", AssetType.IMAGE);
		
		className.set ("img/manatee4.png", __ASSET__img_manatee4_png);
		type.set ("img/manatee4.png", AssetType.IMAGE);
		
		className.set ("img/mart_bg.png", __ASSET__img_mart_bg_png);
		type.set ("img/mart_bg.png", AssetType.IMAGE);
		
		className.set ("img/menu_bg.png", __ASSET__img_menu_bg_png);
		type.set ("img/menu_bg.png", AssetType.IMAGE);
		
		className.set ("img/placebet_bg.png", __ASSET__img_placebet_bg_png);
		type.set ("img/placebet_bg.png", AssetType.IMAGE);
		
		className.set ("img/racecard_bg.png", __ASSET__img_racecard_bg_png);
		type.set ("img/racecard_bg.png", AssetType.IMAGE);
		
		className.set ("img/raceover_bg.png", __ASSET__img_raceover_bg_png);
		type.set ("img/raceover_bg.png", AssetType.IMAGE);
		
		className.set ("img/races_bg.png", __ASSET__img_races_bg_png);
		type.set ("img/races_bg.png", AssetType.IMAGE);
		
		className.set ("img/ranch_bg.png", __ASSET__img_ranch_bg_png);
		type.set ("img/ranch_bg.png", AssetType.IMAGE);
		
		className.set ("img/title_bg.png", __ASSET__img_title_bg_png);
		type.set ("img/title_bg.png", AssetType.IMAGE);
		
		className.set ("sound/title_bg.ogg", __ASSET__sound_title_bg_ogg);
		type.set ("sound/title_bg.ogg", AssetType.MUSIC);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						onChange.dispatch ();
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), ByteArray));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return cast (Type.createInstance (className.get (id), []), ByteArray);
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return bitmapData.getPixels (bitmapData.rect);
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif html5
		
		var bytes:ByteArray = null;
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var data = loader.data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), ByteArray);
		else return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var bytes:ByteArray = null;
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var data = loader.data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String):Future<AudioBuffer> {
		
		var promise = new Promise<AudioBuffer> ();
		
		#if (flash)
		
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				promise.complete (audioBuffer);
				
			});
			soundLoader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			soundLoader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getAudioBuffer (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<AudioBuffer> (function () return getAudioBuffer (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadBytes (id:String):Future<ByteArray> {
		
		var promise = new Promise<ByteArray> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				promise.complete (bytes);
				
			});
			loader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.dataFormat = BINARY;
			loader.onComplete.add (function (_):Void {
				
				promise.complete (loader.data);
				
			});
			loader.onProgress.add (function (_, loaded, total) {
				
				if (total == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (loaded / total);
					
				}
				
			});
			loader.onIOError.add (function (_, e) {
				
				promise.error (e);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<ByteArray> (function () return getBytes (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadImage (id:String):Future<Image> {
		
		var promise = new Promise<Image> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				promise.complete (Image.fromBitmapData (bitmapData));
				
			});
			loader.contentLoaderInfo.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.contentLoaderInfo.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var image = new js.html.Image ();
			image.onload = function (_):Void {
				
				promise.complete (Image.fromImageElement (image));
				
			}
			image.onerror = promise.error;
			image.src = path.get (id);
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Image> (function () return getImage (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = ByteArray.readFile ("../Resources/manifest");
			#elseif ios
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if ios
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	public override function loadText (id:String):Future<String> {
		
		var promise = new Promise<String> ();
		
		#if html5
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.onComplete.add (function (_):Void {
				
				promise.complete (loader.data);
				
			});
			loader.onProgress.add (function (_, loaded, total) {
				
				if (total == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (loaded / total);
					
				}
				
			});
			loader.onIOError.add (function (_, msg) promise.error (msg));
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getText (id));
			
		}
		
		#else
		
		promise.completeWith (loadBytes (id).then (function (bytes) {
			
			return new Future<String> (function () {
				
				if (bytes == null) {
					
					return null;
					
				} else {
					
					return bytes.readUTFBytes (bytes.length);
					
				}
				
			});
			
		}));
		
		#end
		
		return promise.future;
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__img_arrowl_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_arrowr_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_btn_back_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_btn_bet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_btn_buy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_btn_mart_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_btn_races_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_btn_ranch_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_btn_watch_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_confirmbuy_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_manatee_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_manatee1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_manatee2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_manatee3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_manatee4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_mart_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_menu_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_placebet_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_racecard_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_raceover_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_races_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_ranch_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__img_title_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__sound_title_bg_ogg extends null { }


#elseif html5



























#else



#if (windows || mac || linux || cpp)


@:image("assets/img/arrowL.png") #if display private #end class __ASSET__img_arrowl_png extends lime.graphics.Image {}
@:image("assets/img/arrowR.png") #if display private #end class __ASSET__img_arrowr_png extends lime.graphics.Image {}
@:image("assets/img/btn_back.png") #if display private #end class __ASSET__img_btn_back_png extends lime.graphics.Image {}
@:image("assets/img/btn_bet.png") #if display private #end class __ASSET__img_btn_bet_png extends lime.graphics.Image {}
@:image("assets/img/btn_buy.png") #if display private #end class __ASSET__img_btn_buy_png extends lime.graphics.Image {}
@:image("assets/img/btn_mart.png") #if display private #end class __ASSET__img_btn_mart_png extends lime.graphics.Image {}
@:image("assets/img/btn_races.png") #if display private #end class __ASSET__img_btn_races_png extends lime.graphics.Image {}
@:image("assets/img/btn_ranch.png") #if display private #end class __ASSET__img_btn_ranch_png extends lime.graphics.Image {}
@:image("assets/img/btn_watch.png") #if display private #end class __ASSET__img_btn_watch_png extends lime.graphics.Image {}
@:image("assets/img/confirmbuy_bg.png") #if display private #end class __ASSET__img_confirmbuy_bg_png extends lime.graphics.Image {}
@:image("assets/img/manatee.png") #if display private #end class __ASSET__img_manatee_png extends lime.graphics.Image {}
@:image("assets/img/manatee1.png") #if display private #end class __ASSET__img_manatee1_png extends lime.graphics.Image {}
@:image("assets/img/manatee2.png") #if display private #end class __ASSET__img_manatee2_png extends lime.graphics.Image {}
@:image("assets/img/manatee3.png") #if display private #end class __ASSET__img_manatee3_png extends lime.graphics.Image {}
@:image("assets/img/manatee4.png") #if display private #end class __ASSET__img_manatee4_png extends lime.graphics.Image {}
@:image("assets/img/mart_bg.png") #if display private #end class __ASSET__img_mart_bg_png extends lime.graphics.Image {}
@:image("assets/img/menu_bg.png") #if display private #end class __ASSET__img_menu_bg_png extends lime.graphics.Image {}
@:image("assets/img/placebet_bg.png") #if display private #end class __ASSET__img_placebet_bg_png extends lime.graphics.Image {}
@:image("assets/img/racecard_bg.png") #if display private #end class __ASSET__img_racecard_bg_png extends lime.graphics.Image {}
@:image("assets/img/raceover_bg.png") #if display private #end class __ASSET__img_raceover_bg_png extends lime.graphics.Image {}
@:image("assets/img/races_bg.png") #if display private #end class __ASSET__img_races_bg_png extends lime.graphics.Image {}
@:image("assets/img/ranch_bg.png") #if display private #end class __ASSET__img_ranch_bg_png extends lime.graphics.Image {}
@:image("assets/img/title_bg.png") #if display private #end class __ASSET__img_title_bg_png extends lime.graphics.Image {}
@:file("assets/sound/title_bg.ogg") #if display private #end class __ASSET__sound_title_bg_ogg extends lime.utils.ByteArray {}



#end
#end

#if (openfl && !flash)

#end

#end