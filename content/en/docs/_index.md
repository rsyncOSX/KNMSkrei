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

These schematics illustrate the crankshaft phasing and opposed-piston two-stroke cycle of the Napier Deltic T18-37K. They draw on the handbook and the [1967 Napier course notes]({{< relref "/docs/T18_37K/T1837K.md" >}}).

### One-way airflow through each cylinder

The Deltic uses **uniflow scavenging**: blower air enters through inlet ports near one end of each cylinder, sweeps burnt gas towards the other end, and leaves through the exhaust ports. The pistons uncover these openings in the cylinder wall as they move apart. This one-way flow is through each individual cylinder; the gas does not circulate around the triangle.

Viewed from the free end, the inlet and exhaust ends alternate around the triangle: **inlet / exhaust / inlet / exhaust / inlet / exhaust**. The arrangement repeats after a 120° rotation. Each corner crankshaft serves an inlet piston in one adjacent bank and an exhaust piston in the other.

![Free-end view of cylinders A1, B1 and C1 at C1 exhaust top dead centre. Both upper crankshafts turn clockwise, the lower crankshaft turns anticlockwise, and all six port belts are closed.](/images/deltic/t18-37k-phasing-verified.svg)

*Crankshaft phasing at C1 exhaust top dead centre (TDC). Each corner shows the shared crankpin for the two adjacent cylinders.*

The gears fix the relative crankshaft angles and therefore the piston sequence. At the instant shown, the exhaust pistons in B1 and A1 are 40° and 80° before their own TDC, respectively. In each cylinder, the inlet piston reaches TDC 20° after the exhaust piston. The other five cylinders along each bank are at different stages of the cycle.

In sectional drawings, the larger bulb-shaped passages represent the exhaust manifolds, which collect gas along each bank; the smaller passages represent inlet air ducts. The diagram above uses simple port symbols rather than reproducing those manifold shapes.

### Why the blower and piston timing matter

The engine has no separate intake stroke, so it depends on the blower to supply the airflow needed for scavenging and a fresh air charge. On the T18-37K, the turbo-blower is mechanically geared to the crankshafts and assisted by an exhaust turbine.

The exhaust piston leads the inlet piston by **20° of crankshaft rotation**. The exhaust ports open first, allowing cylinder pressure to fall before the inlet ports open. While both are open, blower air sweeps through the cylinder. The exhaust ports also close first; the inlet ports remain open briefly afterwards, allowing the blower to continue charging the cylinder. This sequence is described in the technical manual's [phasing and timing section]({{< relref "/docs/T18_37K/T1837K.md" >}}#figure-4-2).

![Five stages of the opposed-piston cycle: expansion, exhaust release, scavenging, charging and compression. The timing chart shows the exhaust ports opening and closing ahead of the inlet ports.](/images/deltic/t18-37k-cycle-verified.svg)

*Port timing through one revolution, measured from exhaust-piston TDC. Both sources show the exhaust ports opening at 112° and closing at 248°. The handbook shows the inlet ports open from 145° to 255°, while the 1967 Napier course notes give 146.5° to 253.5°.*
