# Project Nocturnal-Eye: Dark Web OSINT & Intel Pipeline

A lightweight, offensive-leaning OSINT aggregator designed to run on a Linux host with compute constraints. This project simulates the **Reconnaissance** and **Weaponization** phases of the Cyber Kill Chain while feeding high-fidelity intelligence into a local **ELK** and **OpenCTI** stack.

## 1. Project Overview
The goal is to automate the discovery of leaked credentials and infrastructure on the dark web without a heavy resource footprint. By using a "Sidecar Tor Proxy," we route Python-based scrapers through the Tor network to index `.onion` content.

### The Stack
* **Offensive Tools:** Tor (Headless), Python (Requests/Socks), TorBot, Ahmia API.
* **Storage & Search:** Elasticsearch (ELK) for raw text indexing.
* **Intelligence Brain:** OpenCTI for mapping relationships between leaked emails and dark web infrastructure.

## 2. Architecture
1.  **Tor Proxy Container:** Provides a SOCKS5 gateway to the dark web.
2.  **Scraper Bot:** A Python environment that queries dark web search engines and crawls onion sites.
3.  **Data Flow:** * *Scraper* $\rightarrow$ *Tor Proxy* $\rightarrow$ *Dark Web*.
    * *Scraper* $\rightarrow$ *ELK* (Raw logs of "Pastes" and "Mentions").
    * *Scraper* $\rightarrow$ *OpenCTI* (Infrastructure and Identity STIX2 objects).

## 3. The "Hacker" Workflow
1.  **Passive Recon:** Querying dark web indexes for target domains or keywords.
2.  **Infrastructure Discovery:** Identifying active `.onion` services related to a threat or target.
3.  **Weaponization Analysis:** Extracting leaked credentials and evaluating their impact via OpenCTI relationship mapping.

## 4. Safety & Compute Notes
* **Resource Friendly:** Uses <200MB RAM for the scraping layer.
* **Isolation:** All dark web traffic is contained within the Docker bridge network via the Tor proxy.