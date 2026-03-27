#!/bin/sh

if [ -z "$SERVER_NAME" ]; then
  ADJECTIVES="blue red wild dark swift brave calm crazy happy funky"
  ANIMALS="platypus narwhal axolotl panda capybara ferret penguin salamander"

  ADJ=$(echo $ADJECTIVES | tr ' ' '\n' | shuf -n1)
  ANIMAL=$(echo $ANIMALS | tr ' ' '\n' | shuf -n1)

  SERVER_NAME="${ADJ}-${ANIMAL}"
  echo "No SERVER_NAME set, generated: $SERVER_NAME"
fi

echo "Starting server: ${SERVER_NAME}-server"
exec sh /server/run.sh