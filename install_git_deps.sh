#!/bin/bash
# Script to install git dependencies for MT3
# These are installed separately to avoid dependency conflicts in Poetry

set -e

echo "Installing git dependencies for MT3..."

# If a virtual environment is active, use its pip
if [ -n "$VIRTUAL_ENV" ]; then
    PIP="$VIRTUAL_ENV/bin/pip"
else
    # Check if .venv exists (Poetry's standard location)
    if [ -d ".venv" ]; then
        PIP=".venv/bin/pip"
    else
        # Otherwise use system pip
        PIP="pip"
    fi
fi

echo "Using pip: $PIP"

# Install git dependencies in the correct order to handle dependencies between them
echo "Installing seqio..."
$PIP install git+https://github.com/google/seqio.git@49213270cc20aaafaa06814502aad655d9275936

echo "Installing flax..."
$PIP install git+https://github.com/google/flax.git@a7157cfb8f5e6be532ea3c1a43d362e9fe3ce540

echo "Installing note-seq..."
$PIP install git+https://github.com/magenta/note-seq.git@35825508885343fb06f93dc87ff491dbbf034505

echo "Installing t5x..."
$PIP install git+https://github.com/google-research/t5x.git@fb11a7619749b1686ab857f31667aa3303766c7e

echo "Git dependencies successfully installed!" 