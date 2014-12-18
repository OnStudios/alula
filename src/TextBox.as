 package {
	 import net.flashpunk.graphics.Text;
   import net.flashpunk.Entity;
   import net.flashpunk.utils.Input;
   import net.flashpunk.utils.Key;
 
   public class TextBox extends Entity {
 
     //A vector of all of the TextBox instances that were added to the screen.
     private static var all_boxes:Vector.<TextBox> = new Vector.<TextBox>();
 
     //True if this text box is reading data.
     private var _reading:Boolean;
 
     //The text being displayed by this text box.
     private var txt:Text;
 
     //Initialize a new TextBox. Only one text box should be reading at a time.
     public function TextBox(text:String = "", x:Number = 0, y:Number = 0) {
       txt = new Text(text);
       super(x, y, txt);
       width = txt.width;
       height = txt.height;
     }
 
     override public function update():void {
      if (_reading) {
         txt.text = Input.keyString;
         width = txt.width;
         height = txt.height;
	  }
	 }
 
     override public function added():void {
       //Add this element into the all_boxes list.
       all_boxes.push(this);
     }
 
     override public function removed():void {
       //Remove this element from the all_boxes list if it was there.
       var idx:int = all_boxes.indexOf(this);
       if (-1 != idx) {
         all_boxes.splice(idx, 1, 0);
       }
     }
  
     public function get text():String { return txt.text; }
     public function set text(str:String):void { txt.text = str; }
     public function get reading():Boolean { return _reading; }
   }
}
