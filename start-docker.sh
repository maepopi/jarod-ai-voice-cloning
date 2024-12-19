#!/bin/bash

docker run \
    -ti \
    --rm \
    --gpus all \
    --name ai-voice-cloning \
    -v "${PWD}/src:/home/user/ai-voice-cloning/src" \
    -v "/home/maelys/AI_PROJECTS/SOUND/TOOLS/Jarod_MRQ/ai-voice-cloning/models:/home/user/ai-voice-cloning/models" \
    -v "/home/maelys/AI_PROJECTS/SOUND/TOOLS/Jarod_MRQ/ai-voice-cloning/training:/home/user/ai-voice-cloning/training" \
    -v "/home/maelys/AI_PROJECTS/SOUND/TOOLS/Jarod_MRQ/ai-voice-cloning/voices:/home/user/ai-voice-cloning/voices" \
    -v "${PWD}/bin:/home/user/ai-voice-cloning/bin" \
    -v "${PWD}/config:/home/user/ai-voice-cloning/config" \
    -v "/home/maelys/AI_PROJECTS/SOUND/TOOLS/Jarod_MRQ/ai-voice-cloning/results:/home/user/ai-voice-cloning/results" \
    --user "$(id -u):$(id -g)" \
    -p "7860:7860" \
    ai-voice-cloning $@  # If pulled from Docker Hub, replace with doctorpopi/ai-voice-cloning

# For dev:
# These lines allow the docker image to pull the latest script changes without rebuilding the image
#     -v "${PWD}/src:/home/user/ai-voice-cloning/src"
#     -v "${PWD}/modules/tortoise_dataset_tools/dataset_whisper_tools:/home/user/ai-voice-cloning/modules/tortoise_dataset_tools/dataset_whisper_tools"
#     -v "${PWD}/modules/dlas/dlas:/home/user/ai-voice-cloning/modules/dlas/dlas"
#     -v "/home/user/ai-voice-cloning/src/__pycache__"

# For testing:
#    -e "PYTORCH_CUDA_ALLOC_CONF=expandable_segments:True"

