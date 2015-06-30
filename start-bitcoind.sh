#!/bin/bash

if [ ! -e "/bitcoind.conf" ]; then
  echo "Bitcoind configuration not mapped.
Restart and specify using '-v /path/to/file.conf:/bitcoind.conf'"
  exit 1
fi

if [ -e "/bitcoin-data/.nodata" ]; then
  echo "Blockchain persistent storage not specified for container.
Restart and specify using '-v /path/to/storage:/bitcoin-data' "
  exit 2
fi

if [ ! -z "$BITCOIN_TESTNET" ]; then
  echo "WARN: Starting bitcoind for testnet"
fi

echo "args: $@"
