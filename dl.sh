#!/usr/bin/env bash

# Main purpose here is to read URLs from a file and run wget on each of them, thus
# downloading them to the current directory.  You are own your own for how you want
# to populate the URLs file.  Failed downloads are written to a
# file, "failed_urls.txt" which you can handle as you wish.

# Set up infinite loop
while :
do
  # Read first line from file containing URLs
  line=$(head -n 1 ./urls.txt)

  # Only proceed if we got a non-empty line back
  if [ "$line" ]; then

    # Download URL
    wget "$line"

    # Capture return code from wget to test for success / failure
    RESULT=$?

    if [ $RESULT -ne 0 ]; then
      # Error
      echo
      echo "Error received on: $line"
      echo "Status code: $RESULT"
      # Record failed URL to file to look at later
      echo $line >> ./failed_urls.txt
      echo
    else
      # Success
      echo
      echo "Success: $line"
      echo
    fi
    # Remove the URL that was just downloaded or attempted by getting all lines from
    # Line 2 until the last line and writing it to a temporary file.  Then, use that
    # temporary file to overwrite the real URL list.  Finally, remove the temporary
    # file.  Basically, poor mans "remove first line from file"
    tail -n +2 ./urls.txt > ./urls.txt.tmp
    cat ./urls.txt.tmp > ./urls.txt
    rm ./urls.txt.tmp
  else
    # An empty line was retrieved from the URLs file, so nothing to do
    echo 'Nothing to do'
  fi

  # Pause between downloads or download attempts by this many seconds.  Recommended
  # that this stay at 5 seconds or greater so you can easily break out of the loop
  # and to give the server a break if downloading multiple files from it.
  sleep 30

done
