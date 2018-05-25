#!/bin/bash

# watch "grep \"NSER\|IVIB\|MAXIMUM GRADIENT\" <`cat CurrentWork` | tail -n 40"
watch "grep \"Cycle\|Pass\|IDiag\|Delta-E=\" <`cat CurrentWork` | tail -n 40"
