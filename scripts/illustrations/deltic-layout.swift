// Original geometric educational schematic. Run with: swift deltic-layout.swift output.png
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
text("One instant in the cycle: cylinder B1 near the end of compression.",70,92,28)
let corners: [(Double,Double)] = [(200,300),(840,300),(520,854.256)]
let pale = NSColor(calibratedRed:0.88,green:0.95,blue:0.94,alpha:1)
let amber = NSColor(calibratedRed:1,green:0.85,blue:0.53,alpha:1)
// Exact documented phase angles; schematic harmonic piston travel (no rod length assumed).
// At this instant B1 exhaust is +10 degrees from its TDC, inlet is -10 degrees.
let exhaustAngles = [10.0,50.0,-30.0] // B1, C1, A1
func travel(_ degrees:Double)->Double {170 * (1-cos(degrees * .pi / 180))/2}
for (index,pair) in [(0,1),(1,2),(2,0)].enumerated() {
 let (a,b)=pair,p=corners[a],q=corners[b],angle=atan2(q.1-p.1,q.0-p.0)
 let e=exhaustAngles[index],i=e-20
 let leftCrown=310-travel(e),rightCrown=330+travel(i)
 ctx.saveGState();ctx.translateBy(x:p.0,y:p.1);ctx.rotate(by:angle)
 rect(125,-43,390,86,pale)
 rect(leftCrown,-40,rightCrown-leftCrown,80,amber)
 line(125,-43,205,-43,teal,6);line(235,-43,405,-43,teal,6);line(435,-43,515,-43,teal,6)
 line(125,43,515,43,teal,6)
 for (port,color) in [(220.0,coral),(420.0,teal)] {
  line(port-15,-85,port-15,-43,color,3);line(port+15,-85,port+15,-43,color,3)
 }
 // Identical 160 x 80 bodies cover both ports at all three phase angles.
 for x in [leftCrown-160,rightCrown] {
  rect(x,-40,160,80,NSColor(calibratedWhite:0.81,alpha:1))
  ctx.setStrokeColor(navy.cgColor);ctx.setLineWidth(3);ctx.stroke(CGRect(x:x,y:-40,width:160,height:80))
 }
 for x in [leftCrown-9,leftCrown-16,rightCrown+9,rightCrown+16] {line(x,-38,x,38,navy,2)}
 // Motion arrows outside the cylinder; none at B's near-minimum-volume reference.
 if index==1 {arrow(leftCrown-10,68,leftCrown-50,68,navy);arrow(rightCrown+10,68,rightCrown+50,68,navy)}
 if index==2 {arrow(leftCrown-50,68,leftCrown-10,68,navy);arrow(rightCrown+50,68,rightCrown+10,68,navy)}
 ctx.restoreGState()
}
// Upright labels at each duct, repeated by exactly 120 degrees.
for (a,b) in [(0,1),(1,2),(2,0)] {
 let p=corners[a],q=corners[b],angle=atan2(q.1-p.1,q.0-p.0)
 for (port,label,color) in [(220.0,"E",coral),(420.0,"I",teal)] {
  let x=p.0+port*cos(angle)+110*sin(angle)
  let y=p.1+port*sin(angle)-110*cos(angle)
  text(label,x-9,y-15,25,true,color)
 }
}
for (i,p) in corners.enumerated() {
 ctx.setFillColor(pale.cgColor);ctx.fillEllipse(in:CGRect(x:p.0-39,y:p.1-39,width:78,height:78))
 ctx.setStrokeColor(teal.cgColor);ctx.setLineWidth(4);ctx.strokeEllipse(in:CGRect(x:p.0-39,y:p.1-39,width:78,height:78))
 ctx.setFillColor(navy.cgColor);ctx.fillEllipse(in:CGRect(x:p.0-9,y:p.1-9,width:18,height:18))
 let label=["AB","BC","CA"][i]
 text(label,p.0-23,p.1+(i==2 ? 50 : -85),26,true)
}
text("Bank B",460,155,28,true)
text("Bank A",130,600,28,true)
text("Bank C",780,600,28,true)
line(960,190,960,925,teal,3)
text("B1  End of compression",1010,205,28,true)
text("Exhaust: 10° after TDC",1010,251,24)
text("Inlet: 10° before TDC",1010,285,24)
text("Near minimum chamber volume.",1010,326,23)
text("A1  Compressing",1010,405,28,true)
text("Exhaust: 30° before TDC",1010,451,24)
text("Inlet: 50° before TDC",1010,485,24)
text("Both pistons moving inward.",1010,526,23)
text("C1  Expanding",1010,605,28,true)
text("Exhaust: 50° after TDC",1010,651,24)
text("Inlet: 30° after TDC",1010,685,24)
text("Both pistons moving outward.",1010,726,23)
text("I  Inlet     E  Exhaust",1010,801,26,true)
text("All six ports are closed here;",1010,846,23)
text("there is no scavenging airflow.",1010,879,23)
// Rotation arrows indicate direction only, not a connecting-rod model.
for (index,p) in corners.enumerated() {
 let direction = index==2 ? -1.0 : 1.0
 var last:(Double,Double)?=nil
 for step in 0...30 {
  let angle=(-120+direction*Double(step)*8) * Double.pi/180
  let point=(p.0+51*cos(angle),p.1+51*sin(angle))
  if let previous=last {if step==30 {arrow(previous.0,previous.1,point.0,point.1,navy)} else {line(previous.0,previous.1,point.0,point.1,navy,3)}}
  last=point
 }
}
text("No. 1 cylinders • Viewed from the free end • Upper shafts clockwise; lower shaft anticlockwise",70,970,23,true)
text("Phase angles from the T18-37K manual; piston travel uses a simplified harmonic projection.",70,1016,23)
text("Not to scale • Rods and gears omitted • Other cylinders along each bank are at different phases",70,1053,21)
let img=ctx.makeImage()!, rep=NSBitmapImageRep(cgImage:img)
try rep.representation(using:.png,properties:[:])!.write(to:URL(fileURLWithPath:CommandLine.arguments[1]))
