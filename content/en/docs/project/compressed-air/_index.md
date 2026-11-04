---
title: "Compressed-air system"
weight: 30
aliases: ["/docs/compressed-air/", "/docs/project/scope/compressed-air/"]
description: "Survey and verification of starting air for the main and auxiliary engines and all connected compressed-air components."
---

Both the main propulsion engines and the auxiliary engines aboard HNoMS Skrei use **compressed-air starting**, as confirmed by the project contributor on **3 November 2026**. This establishes the starting method; it does not establish the detailed circuit, equipment ratings or present serviceability.

## Main-engine arrangement described in the manual

[Chapter 12: Starting System]({{< relref "/docs/T18_37K/T1837K.md" >}}#chapter-12) describes direct air starting through six starting valves in **A bank**, supplied through a junction box and air manifold rail. An A-camshaft-driven distributor controls the starting valves. The junction box also supplies the cold starting aid, and a connection from the air manifold rail supplies the starting accumulator described in [Chapter 11]({{< relref "/docs/T18_37K/T1837K.md" >}}#chapter-11).

Use the chapter’s layout and component drawings to compare each installed main engine with the source arrangement. Record the junction-box strainer, manifold, distributor, main and operating-air connections, starting valves, accumulator supply and any cold-starting equipment actually fitted. Keep the starting accumulator’s control-system function distinct from the vessel’s bulk air receivers.

This describes the T18-37K source arrangement. Trace Skrei’s installation before recording it as confirmed, and use the auxiliary engines’ own manuals for their starting equipment. The Deltic notes do not establish the identity or ratings of the vessel’s compressors and receivers.

## Reported class compressor specification

The [Norwegian Wikipedia class specifications](https://no.wikipedia.org/wiki/Tjeld-klassen#Spesifikasjoner), checked on 3 November 2026, list **two Wilhelm Poppe GmbH compressors, type WP 2340 S**, with a reported capacity of **127.4 l/min at 30.3 bar** each. Treat these as class reference figures pending identification of both installed compressors and confirmation from their plates and manuals.

Record each compressor’s actual drive, location, serial number, delivery-pressure rating and capacity basis. Establish whether the quoted flow is free-air delivery or another measurement basis. The reported 30.3 bar figure does not establish receiver ratings, relief settings, engine starting pressure or a test pressure. Verify each separately before commissioning.

## Trace and register the complete system

Prepare an as-found diagram from every air source through storage and distribution to each main engine, auxiliary engine and other air consumer. Trace charging, starting, control and service-air circuits separately where fitted, including cross-connections, reserve supplies, vents and drains. Record unidentified branches and inaccessible sections as open items.

Give every maintainable component a unique identifier. Record its location, duty, manufacturer, model, serial number, rated pressure, applicable temperature and capacity ratings, condition, maintenance history and supporting manual or certificate. Link photographs and inspection results to the diagram and equipment register.

The checklist below defines survey scope, not a finding that every listed item is installed. Mark each item as present, absent or not yet verified; confirm absence by tracing the installation. Record defects, required work, responsible person, acceptance criteria and verification evidence for each installed component.

## Component survey and verification checklist

| Component or assembly | Checks to define and record |
| --- | --- |
| Compressors and drives | Identify every main, auxiliary, standby and portable charging source. Inspect mountings, guards, belts or couplings, lubrication, intake filters, compressor stages, unloading arrangements and drive condition. Establish duty, capacity and dependence on engine operation or electrical supply. |
| Compressor cooling and air treatment | Trace cooling water or airflow, intercoolers, aftercoolers, separators, filters and dryers where fitted. Inspect condition, blockage, leakage, condensate collection and manual or automatic drains; establish servicing requirements. |
| Charging lines and manifolds | Trace each compressor discharge to its receiver. Inspect pipework, connections, supports, isolation and non-return valves; verify the intended flow direction and protection against backflow. |
| Air receivers and reserve bottles | Record identity, volume, rated pressure, nameplate condition, inspection history and certificates. Assess accessible corrosion, supports, securing, connections and drains. Have a competent pressure-vessel specialist define internal examination and any testing or certification required. |
| Pressure protection | Identify relief valves and any bursting devices, their protected sections, documented settings and discharge routes. Check for missing protection or isolation that could defeat it. Arrange specialist inspection and verification against approved requirements. |
| Distribution pipework, hoses and fittings | Trace every branch and cross-connection. Inspect corrosion, chafing, damage, supports, hose age and suitability, fittings and pressure ratings, including concealed sections. Identify isolation points and any pressure-reducing stations. |
| Valves and pressure regulation | Identify shut-off, non-return, reducing, regulating, unloading, drain and vent valves. Verify identification, accessibility, condition, intended positions, direction of flow and function under an agreed test plan. |
| Main-engine starting equipment | Trace each engine’s air supply and controls. Identify the installed starting mechanism and, where fitted, main starting valves, distributors, cylinder starting valves, air starters, pilot lines and engine-side protective devices. Inspect and test against the correct engine manual. |
| Auxiliary-engine starting equipment | Trace the supply and starting mechanism for every auxiliary engine, including local controls, pilot lines, valves or air starters where fitted. Verify isolation and starting requirements independently for each set. |
| Instruments, controls and interlocks | Inventory pressure gauges, switches, sensors, compressor start/stop controls, alarms, local and remote starting controls, permissives and interlocks. Define calibration and functional checks, including response to low air pressure and loss of control power where applicable. |
| Other compressed-air consumers | Identify service outlets, pneumatic tools, controls and any other air-operated equipment actually connected. Verify required pressure, regulation, isolation and the effect of their use or leakage on starting-air reserves. |
| Drains, vents and discharge arrangements | Trace discharge destinations from receivers, coolers, separators and low points. Verify accessibility, condition and operation, and define collection and disposal arrangements for oily condensate. |

## Starting-air availability and dependencies

- Show which receivers and compressors serve each main and auxiliary engine and whether supplies can be isolated independently.
- Establish the required starting pressure, allowable pressure range, reserve capacity and starting demand from the installed equipment’s manuals and agreed operating requirements; do not assume common values for all engines.
- Document how the first auxiliary engine is started when all machinery is stopped, and how the system is recharged if receivers are depleted. Identify any circular dependency between an air-started engine and the compressor it drives or powers.
- Assess the effect of losing a compressor, receiver or distribution branch, and of simultaneous starting demand or other air use. Record any unavailable reserve or recovery arrangement as an unresolved dependency.

## Inspection and commissioning evidence

Before intrusive work, use an agreed isolation procedure covering stored pressure, connected supplies and unintended engine starting. Before pressurisation, have competent specialists establish the required examination, repairs, pressure-vessel status and approved test method. Do not select test pressures or relief settings from generic guidance.

After the required inspections and repairs, use an approved commissioning plan to verify cleanliness, leakage, charging performance, pressure regulation, drains, non-return protection, instruments, alarms and protective functions. Record measured results against manufacturer limits and specialist-approved acceptance criteria.

Proceed to controlled starting trials for **each main engine and each auxiliary engine** only after the engine-specific readiness checks are accepted. Record receiver pressure before and after starting, pressure at the engine where specified, recharge performance, control response and any defects. Verify the agreed reserve and recovery arrangements under the trial plan.

Retain signed inspection and test records, certificates, unresolved defects, the updated system diagram, normal valve positions, operating instructions and maintenance intervals. Apply the [baseline and verification process]({{< relref "/docs/project/planning-and-verification.md" >}}) and link the results to the [engine department work scope]({{< relref "/docs/project/engine-department.md" >}}#starting-and-compressed-air).
