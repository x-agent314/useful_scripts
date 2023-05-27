# ┌──────────┬────────────────────────────────────────────┬────────────┐
# │          │                                            │            │
# │          │                                            │            │
# │          ├─┬────────────────────────────────────────┬─┤            │
# │          │ │ PERSONAL COLLECTION OF NMAP SIGNATURES │ │            │
# ├──────────┴─┴────────────────────────────────────────┴─┴────────────┤
# │                                                                    │
# │                                                                    │
# │                                                                    │
# └────────────────────────────────────────────────────────────────────┘
# ┌───┬─────────────────────────────────────────────────┬──────────────┐
# │   │   EXHAUSTIVE TCP SCAN (FINGERPRINTING)          │              │
# └───┴─────────────────────────────────────────────────┴──────────────┘

nmap \
  -sS               # TCP SYN scan (stealth scan)
  -Pn               # Skip host discovery, assume all targets are online
  -T4               # Aggressive scan timing template
  -v                # Enable verbose output
  -A                # Enable aggressive service and version detection
  -p0-65535         # Scan port range from 0 to 65535
 
# Note: The original command used the -P0 flag, which was deprecated
# starting from Nmap 6.49BETA5 [2015-09-25]. 

# ┌───┬─────────────────────────────────────────────────┬──────────────┐
# │   │   RANDOM SEARCH FOR 250 DECOYS                  │              │
# └───┴─────────────────────────────────────────────────┴──────────────┘

nmap \
  -sP           # Perform host discovery using ICMP echo requests (ping)
  -T4           # Aggressive Timing Template 4:
  -iR 250       # Scan 250 randomly selected target IP addresses

# ┌───┬─────────────────────────────────────────────────┬──────────────┐
# │   │    OS FINGERPRINTING (USING DECOYS)             │              │
# └───┴─────────────────────────────────────────────────┴──────────────┘
nmap -sS -F -Pn -O -T4 -v -D[decoyslist] [IP addresses]
# -sS: TCP SYN scan (stealthy scan using SYN packets)
# -F: Fast scan (scanning common ports only)
# -Pn: Disable host discovery (assume specified IP addresses are up)
# -O: Enable OS detection
# -T4: Timing template set to Aggressive (faster scan, more noise)
# -v: Increase verbosity level
# -D[decoyslist]: Specify decoy IP addresses (cover for scan)
# [IP addresses]: Target IP addresses to be scanned


