#!/bin/bash

# Define an array of cache sizes (in KB)
cache_sizes=(1 2 4 8 16 32 64)

# Loop over each cache size
for size in "${cache_sizes[@]}"; do
    # Set the cache size parameter for the simulation
    sed -i "s/#define CACHE_SIZE .*/#define CACHE_SIZE_${size}KB ${size}024/g" cache.c

    # Rebuild SimpleScalar
    make

    # Run the simulation
    ./sim-cache <your_trace_file>

    # You can include additional commands to process simulation results, plot graphs, etc.
done
