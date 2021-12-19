#!/bin/bash
FILE=$1

if [ -z "$FILE" ]; then
    echo "Usage: $0 gamebook.dot"
    exit 1
fi

# get number of episodes with at least one transition
NUMBER_EPISODES_WITH_TRANSITION=$(grep -c -- "->" $FILE)
echo "Number of episodes with at least one transition: $NUMBER_EPISODES_WITH_TRANSITION"

# extract all transitions, get number of transitions per episode, sum all numbers
NUMBER_TRANSITIONS=$(grep -- "->" $FILE | cut -d ">" -f 2 | awk '{print NF}' | paste -sd+ | bc)
echo "Number of transitions: $NUMBER_TRANSITIONS"

# ratio of transitions to episodes
RATIO=$(echo "scale=2; $NUMBER_TRANSITIONS / $NUMBER_EPISODES_WITH_TRANSITION" | bc)
echo "Ratio of transitions to episodes: $RATIO"