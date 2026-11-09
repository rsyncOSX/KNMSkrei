---
title: "Restoration documentation"
weight: 10
menu:
  main:
    weight: 10
description: "The project record, photographs and background references."
---

{{% alert title="Private documentation project" color="info" %}}
This website is a private documentation project. For the official documentation of KNM Skrei, visit [Marinens Veteranskip](https://www.marinensveteranskip.no).
{{% /alert %}}

This is the English documentation for the restoration of the engine department of **HNoMS Skrei (KNM Skrei)**.

## Explore the documentation

- [Restoration project](project/): engine department work scope, baseline survey, planning and verification.
- [Main engines](main-engines/): Napier Deltic T18-37K identification and machinery records.
- [Napier Deltic T18-37K manual]({{< relref "/docs/T18_37K/_index.md" >}}): illustrated course notes and original PDF scans.
- [Electrical installation]({{< relref "/docs/electrical-installation/index.md" >}}): Chapter 5 of the Tjeld handbook in English, with original Norwegian drawings.
- [Some photos November 2026](images/): photographs of Skrei before restoration.
- [Napier heritage links](links/): English-language research and reference material.
- [Other Deltic restoration projects](other-restoration-projects/): engine rebuilds, related marine projects and links to their records.
- [Nasty/Tjeld class and engines](vessels-and-engines/): background on the vessels and their propulsion.

## Understanding the Napier Deltic

These new illustrations were created with AI assistance from the descriptions and specifications in the [Napier Deltic T18-37K technical manual]({{< relref "/docs/T18_37K/T1837K.md" >}}). They explain the engine's triangular layout and opposed-piston two-stroke cycle. They are simplified educational schematics, not original Napier drawings or maintenance instructions.

### One-way airflow through each cylinder

The Deltic uses **uniflow scavenging**: blower air enters through inlet ports near one end of each cylinder, sweeps burnt gas towards the other end, and leaves through the exhaust ports. The pistons uncover these openings in the cylinder wall as they move apart. This one-way flow is through each individual cylinder; the gas does not circulate around the triangle.

Viewed from the free end, the inlet and exhaust ends alternate around the triangle: **inlet / exhaust / inlet / exhaust / inlet / exhaust**. The arrangement repeats after a 120° rotation. Each corner crankshaft serves an inlet piston in one adjacent bank and an exhaust piston in the other.

![Deltic No. 1 cylinders at one shared crankshaft instant, viewed from the free end: B1 near minimum combustion-space volume, A1 compressing, and C1 expanding. Upper crankshafts rotate clockwise and the lower one anticlockwise. All inlet and exhaust ports are closed at this instant.](/images/deltic/t18-37k-layout-v4.png)

*Engine layout: three banks of six cylinders, with two opposed pistons in each cylinder. I marks inlet ports supplied by the blower; E marks exhaust ports connected to the manifold. This view shows cylinders A1, B1 and C1 at the same instant, with B1 near the end of compression. All six ports shown are closed, so no airflow arrows are drawn. Connecting rods and phasing gears are omitted.*

The gears fix the relative crankshaft angles and therefore the piston sequence. At the chosen instant, B1's exhaust piston is 10° after its own top dead centre (TDC), and its inlet piston is 10° before its own TDC. A1 is still compressing and C1 is expanding. These angles follow the manual's No. 1 cylinder phasing reference: C1 exhaust at TDC, B1 exhaust 40° before TDC, and A1 exhaust 80° before TDC, with the exhaust piston in each cylinder leading its inlet piston by 20°.

The picture uses a simplified harmonic projection for piston travel, rather than an exact connecting-rod calculation. It illustrates the documented phase relationships near B1's minimum chamber volume, not the precise fuel-injection instant. The other five cylinders along each bank are at different stages; an entire bank does not reach compression together.

In sectional drawings, the larger bulb-shaped passages represent the exhaust manifolds, which collect gas along each bank; the smaller passages represent inlet air ducts. The diagram above uses simple port symbols rather than reproducing those manifold shapes.

### Why the blower and piston timing matter

The engine has no separate intake stroke, so it depends on the blower to supply the airflow needed for scavenging and a fresh air charge. On the T18-37K, the turbo-blower is mechanically geared to the crankshafts and assisted by an exhaust turbine.

The exhaust piston leads the inlet piston by **20° of crankshaft rotation**. The exhaust ports open first, allowing cylinder pressure to fall before the inlet ports open. While both are open, blower air sweeps through the cylinder. The exhaust ports also close first; the inlet ports remain open briefly afterwards, allowing the blower to continue charging the cylinder. This sequence is described in the technical manual's [phasing and timing section]({{< relref "/docs/T18_37K/T1837K.md" >}}#figure-4-2).

![Four stages of the opposed-piston two-stroke cycle, with identical piston dimensions in every panel: compression, injection and expansion, exhaust release, and scavenging through cylinder-wall ports uncovered by the piston crowns.](/images/deltic/t18-37k-cycle-v3.png)

*Operating cycle: one representative cylinder is drawn with its inlet on the left and exhaust on the right. Rotate this view to match the corresponding bank in the triangular layout. Piston dimensions stay constant; the four panels show selected stages rather than a complete timing diagram.*
