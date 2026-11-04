// Original geometric educational schematic. Run with: swift deltic-cycle.swift output.png
import AppKit
import CoreText
let w = 1600, h = 1100
let cs = CGColorSpaceCreateDeviceRGB()
let ctx = CGContext(data:nil,width:w,height:h,bitsPerComponent:8,bytesPerRow:0,space:cs,bitmapInfo:CGImageAlphaInfo.premultipliedLast.rawValue)!
ctx.translateBy(x:0,y:CGFloat(h)); ctx.scaleBy(x:1,y:-1)
let navy = NSColor(calibratedRed:0.04,green:0.12,blue:0.23,alpha:1)
let teal = NSColor(calibratedRed:0,green:0.52,blue:0.49,alpha:1)
let coral = NSColor(calibratedRed:0.87,green:0.28,blue:0.19,alpha:1)
func rect(_ x:Double,_ y:Double,_ width:Double,_ height:Double,_ color:NSColor) {ctx.setFillColor(color.cgColor);ctx.fill(CGRect(x:x,y:y,width:width,height:height))}
func line(_ x:Double,_ y:Double,_ xx:Double,_ yy:Double,_ color:NSColor,_ width:Double=3) {ctx.setStrokeColor(color.cgColor);ctx.setLineWidth(width);ctx.move(to:CGPoint(x:x,y:y));ctx.addLine(to:CGPoint(x:xx,y:yy));ctx.strokePath()}
func text(_ str:String,_ x:Double,_ y:Double,_ size:Double=24,_ bold:Bool=false,_ color:NSColor=navy){
 let font = bold ? NSFont.boldSystemFont(ofSize:size) : NSFont.systemFont(ofSize:size)
 let a = NSAttributedString(string:str,attributes:[.font:font,.foregroundColor:color])
 ctx.saveGState();ctx.translateBy(x:x,y:y+size);ctx.scaleBy(x:1,y:-1);ctx.textPosition = .zero
 CTLineDraw(CTLineCreateWithAttributedString(a),ctx);ctx.restoreGState()
}
func arrow(_ x:Double,_ y:Double,_ xx:Double,_ yy:Double,_ color:NSColor){
 line(x,y,xx,yy,color,7);let a=atan2(yy-y,xx-x),d=15.0
 ctx.setFillColor(color.cgColor);ctx.move(to:CGPoint(x:xx,y:yy));ctx.addLine(to:CGPoint(x:xx-d*cos(a-0.5),y:yy-d*sin(a-0.5)));ctx.addLine(to:CGPoint(x:xx-d*cos(a+0.5),y:yy-d*sin(a+0.5)));ctx.closePath();ctx.fillPath()
}
// Every piston is drawn by this one function: body 110 x 96, including rings and pin.
func piston(_ crown:Double,_ y:Double,_ left:Bool){
 let x=left ? crown-110 : crown
 rect(x,y,110,96,NSColor(calibratedWhite:0.81,alpha:1))
 ctx.setStrokeColor(navy.cgColor);ctx.setLineWidth(3);ctx.stroke(CGRect(x:x,y:y,width:110,height:96))
 for offset in [8.0,15.0,22.0] {let r=left ? crown-offset : crown+offset;line(r,y+2,r,y+94,navy,2)}
 let pin=left ? x+32 : x+78
 ctx.setFillColor(NSColor.white.cgColor);ctx.fillEllipse(in:CGRect(x:pin-7,y:y+41,width:14,height:14))
 ctx.setStrokeColor(navy.cgColor);ctx.strokeEllipse(in:CGRect(x:pin-7,y:y+41,width:14,height:14))
 if left {line(x-65,y+48,x,y+48,navy,8)} else {line(x+110,y+48,x+175,y+48,navy,8)}
}
rect(0,0,1600,1100,.white)
text("Napier Deltic T18-37K",70,30,48,true)
text("How the opposed-piston two-stroke cycle works",70,92,28)
let titles=["1  Compression","2  Injection and expansion","3  Exhaust release","4  Scavenging and charging"]
let captions=[["The pistons move inward, compressing","air trapped between their crowns."],["Fuel ignites in the hot compressed air,","driving the pistons apart."],["The exhaust piston uncovers its ports first,","allowing burnt gas to escape."],["Blower air enters the inlet ports and flows","across the cylinder to the exhaust ports."]]
for i in 0..<4 {
 let ox=Double(i%2)*770+40, oy=Double(i/2)*390+160
 rect(ox,oy,750,365,NSColor(calibratedWhite:0.97,alpha:1))
 rect(ox,oy,750,53,NSColor(calibratedRed:0.87,green:0.94,blue:0.93,alpha:1))
 text(titles[i],ox+20,oy+9,28,true)
 let sx=ox+155, sy=oy+155, length=440.0
 let exhaust=sx+100, inlet=sx+340
 let l=[sx+195,sx+195,sx+70,sx+70][i]
 let r=[sx+250,sx+250,sx+318,sx+370][i]
 rect(sx,sy,length,96,NSColor(calibratedWhite:0.97,alpha:1))
 rect(l,sy,r-l,96,i<2 ? NSColor(calibratedRed:0.9,green:0.95,blue:0.95,alpha:1) : i==2 ? NSColor(calibratedRed:1,green:0.85,blue:0.53,alpha:1) : NSColor(calibratedRed:0.78,green:0.94,blue:0.91,alpha:1))
 // Fixed wall apertures and ducts, with no opening into the rod space.
 line(sx,sy,exhaust-14,sy,teal,6);line(exhaust+14,sy,inlet-14,sy,teal,6);line(inlet+14,sy,sx+length,sy,teal,6)
 line(sx,sy+96,sx+length,sy+96,teal,6)
 for port in [inlet,exhaust] {line(port-14,sy-42,port-14,sy,teal,3);line(port+14,sy-42,port+14,sy,teal,3)}
 piston(l,sy,true);piston(r,sy,false)
 text("Inlet: \(i==3 ? "open" : "closed")",sx+255,oy+83,21,true)
 text("Exhaust: \(i>=2 ? "open" : "closed")",sx+25,oy+83,21,true)
 if i==0 {arrow(l-35,sy+123,l+5,sy+123,navy);arrow(r+35,sy+123,r-5,sy+123,navy)}
 if i==1 {
  let mid=(l+r)/2;line(mid,sy-44,mid,sy+12,navy,5);text("Fuel",mid-20,oy+110,18)
  ctx.setFillColor(NSColor.orange.cgColor);ctx.fillEllipse(in:CGRect(x:mid-14,y:sy+32,width:28,height:28))
  arrow(l+5,sy+123,l-35,sy+123,navy);arrow(r-5,sy+123,r+35,sy+123,navy)
 }
 if i>=2 {arrow(exhaust,sy+45,exhaust,sy-40,coral)}
 if i==3 {arrow(inlet,sy-40,inlet,sy+48,teal);arrow(inlet-10,sy+48,exhaust+22,sy+48,teal)}
 text(captions[i][0],ox+23,oy+291,23);text(captions[i][1],ox+23,oy+321,23)
}
text("The exhaust piston leads the inlet piston by 20° of crankshaft rotation.",70,961,28,true)
text("Identical piston symbols in every panel; only their positions change.",70,1003,23)
text("Simplified section • Not to scale • Not a timing-setting diagram",70,1041,21)
let img=ctx.makeImage()!, rep=NSBitmapImageRep(cgImage:img)
try rep.representation(using:.png,properties:[:])!.write(to:URL(fileURLWithPath:CommandLine.arguments[1]))
