# 🛠 Project Nocturnal-Eye Implementation Checklist

## Phase 1: Environment Setup
- [ ] Create project directory `mkdir -p ~/cyber-lab/nocturnal-eye/scripts`.
- [ ] Initialize `docker-compose.yml` with Tor Proxy and Scraper service.
- [ ] Build the `Dockerfile` for the Python environment (include `git`, `curl`, and `socks` support).
- [ ] Verify connectivity: Run a test script to fetch the IP of `https://check.torproject.org` via the container.

## Phase 2: Offensive Recon (The Scraper)
- [ ] **Develop `dark_search.py`**:
    - [ ] Implement Ahmia.fi API integration.
    - [ ] Create a "Target List" (e.g., your AWS domain or test emails).
- [ ] **Integration with ELK**:
    - [ ] Create an Elasticsearch index named `darkweb-raw-index`.
    - [ ] Add a function to the script to POST raw HTML/Text to ELK.
- [ ] **Deploy TorBot**:
    - [ ] Configure TorBot within the container to crawl 1-level deep on discovered `.onion` links.

## Phase 3: Intelligence Mapping (OpenCTI)
- [ ] Obtain OpenCTI API Token and URL.
- [ ] **Develop `intel_pusher.py`**:
    - [ ] Map discovered `.onion` URLs to "Infrastructure" entities.
    - [ ] Map discovered emails to "Identity" entities.
    - [ ] Create a "Relationship" between the Leak and the Infrastructure.
- [ ] Test the pipeline: Search a keyword $\rightarrow$ See it appear in ELK $\rightarrow$ See the relationship graph in OpenCTI.

## Phase 4: Expansion (Optional)
- [ ] **AWS Free Tier Integration**: Move the Tor Proxy to AWS to shift the exit node traffic away from your local home IP.
- [ ] **Automated Alerts**: Set up an ELK Watcher or Alert to notify you when a specific "High Value" keyword is found on the dark web.

---
**Status:** 🌑 Not Started