# MT3: Multi-Task Multitrack Music Transcription

MT3 is a multi-instrument automatic music transcription model that uses the [T5X framework](https://github.com/google-research/t5x).

This is not an officially supported Google product.

## Installation

This project uses [Poetry](https://python-poetry.org/) for dependency management.

```bash
# Install Poetry if you haven't already
curl -sSL https://install.python-poetry.org | python3 -

# Clone the repository
git clone https://github.com/magenta/mt3.git
cd mt3

# Install dependencies using Poetry
poetry install

# Install git dependencies (flax, note-seq, seqio, and t5x)
# These are installed separately to avoid dependency conflicts
./install_git_deps.sh

# Activate the virtual environment
poetry shell
```

## Transcribe your own audio

Use our [colab notebook](https://colab.research.google.com/github/magenta/mt3/blob/main/mt3/colab/music_transcription_with_transformers.ipynb) to
transcribe audio files of your choosing.  You can use a pretrained checkpoint from
either a) the piano transcription model described in [our ISMIR 2021 paper](https://archives.ismir.net/ismir2021/paper/000030.pdf)
or b) the multi-instrument transcription model described in
[our ICLR 2022 paper](https://openreview.net/pdf?id=iMSjopcOn0p).


## Train a model

For now, we do not (easily) support training.  If you like, you can try to
follow the [T5X training instructions](https://github.com/google-research/t5x#training)
and use one of the tasks defined in [tasks.py](mt3/tasks.py).

## Development

This project is configured with Python 3.11 as the target version. We use:

- [Poetry](https://python-poetry.org/) for dependency management
- [pyenv](https://github.com/pyenv/pyenv) or [mise](https://mise.jdx.dev/) for Python version management
- [pytest](https://docs.pytest.org/) for testing

Git dependencies (flax, note-seq, seqio, and t5x) need to be installed separately using the provided script:

```bash
./install_git_deps.sh
```
