#!/usr/bin/env python3

import datetime
import subprocess
import sys

import serial
import numpy as np
from config import Settings


def toMacro(name, value, k=None):
  if value > 30000:
    value = f"{round(value/1000):,}k"
  else:
    value = f"{value:,}"
  value = value.replace(",", "\\,")
  return f"\\newcommand{{\\{name}}}{{{value}}}\n"

def run_bench(scheme, impl, test, iterations):
    subprocess.check_call(f"make clean", shell=True)
    binary = f"bin/crypto_kem_{scheme}_{impl}_{test}.bin"
    make = f"make IMPLEMENTATION_PATH=crypto_kem/{scheme}/{impl} CRYPTO_ITERATIONS={iterations} {binary}"
    subprocess.check_call(make, shell=True)

    try:
        subprocess.check_call(f"st-flash write {binary} 0x8000000", shell=True)
        subprocess.check_call(f"st-flash reset", shell=True)
    except:
        print("flashing failed --> retry")
        return run_bench(scheme, impl, test, iterations)

    # get serial output and wait for '#'
    with serial.Serial(Settings.SERIAL_DEVICE, 115200, timeout=10) as dev:
        logs = []
        iteration = 0
        log = b""
        while iteration < iterations:
            device_output = dev.read()
            if device_output == b'':
                print("timeout --> retry")
                return run_bench(scheme, impl, test, iterations)
            sys.stdout.buffer.write(device_output)
            sys.stdout.flush()
            log += device_output
            if device_output == b'#':
                logs.append(log)
                log = b""
                iteration += 1
    return logs


def parseLogSpeed(log, ignoreErrors):
    log = log.decode(errors="ignore")
    if "error" in log.lower() and not ignoreErrors:
        raise Exception("error in scheme. this is very bad.")
    lines = str(log).splitlines()

    def get(lines, key):
        if key in lines:
            return int(lines[1+lines.index(key)])
        else:
            return None

    def cleanNullTerms(d):
        return {
            k:v
            for k, v in d.items()
            if v is not None
        }

    return cleanNullTerms({
        "-speed-ccakeygen":  get(lines, "cca keypair cycles:"),
        "-speed-encaps":  get(lines, "encaps cycles:"),
        "-speed-decaps":  get(lines, "decaps cycles:"),
        "-speed-matrix-vectormul" : get(lines, "matrix vector mul cycles:"),
    })


def average(results):
    avgs = dict()
    for key in results[0].keys():
        avgs[key] = int(np.array([results[i][key] for i in range(len(results))]).mean())
    return avgs


def bench(scheme, texName, impl, test, iterations, outfile, ignoreErrors=False):
    logs    = run_bench(scheme, impl, test, iterations)
    results = []
    for log in logs:
        try:
            result = parseLogSpeed(log, ignoreErrors)
        except:
            breakpoint()
            print("parsing log failed -> retry")
            return bench(scheme, texName, impl, test, iterations, outfile)
        results.append(result)

    avgResults = average(results)
    print(f"% {test} results for {scheme} (impl={impl})", file=outfile)

    for key, value in avgResults.items():
        macro = toMacro(f"{texName}{key}", value)
        print(macro.strip())
        print(macro, end='', file=outfile)
    print('', file=outfile, flush=True)


with open(f"benchmarks.tex", "a") as outfile:
    iterations = 1

    now = datetime.datetime.now(datetime.timezone.utc)
    print(f"% Benchmarking measurements written on {now}; iterations={iterations}\n", file=outfile)
    bench("lightsaber", "lightsaber-tmvp", "tmvp", "speed", iterations, outfile)
    bench("saber", "saber-tmvp", "tmvp", "speed", iterations, outfile)
    bench("firesaber", "firesaber-tmvp", "tmvp",  "speed", iterations, outfile)
    
    bench("lightsaber", "lightsaber-blockrec", "blockrec", "speed",  iterations, outfile, True)
    bench("saber", "saber-blockrec", "blockrec", "speed", iterations, outfile, True)
    bench("firesaber", "firesaber-blockrec", "blockrec", "speed",  iterations, outfile, True)    
    



