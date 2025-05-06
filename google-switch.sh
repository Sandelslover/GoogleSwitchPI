#!/bin/bash

# URLs for Google Sheets (view-only) and Calendar
SHEET_URL="google sheets url here"
CALENDAR_URL="google calendar url here"

# Ensure Chromium is installed
if ! command -v chromium-browser &> /dev/null; then
    sudo apt-get update
    sudo apt-get install -y chromium-browser
fi

# Install unclutter to hide cursor
if ! command -v unclutter &> /dev/null; then
    sudo apt-get install -y unclutter
fi

# Start Chromium in kiosk mode and hide cursor
unclutter -idle 0.1 -root &

# Wait 2 minutes to allow system to fully boot
sleep 120

# Function to open URL in Chromium
open_url() {
    chromium-browser --noerrdialogs --disable-infobars --kiosk "$1" &
    CHROMIUM_PID=$!
}

# Main loop to switch between URLs
while true; do
    # Open Google Sheets (view-only)
    open_url "$SHEET_URL"
    sleep 90  # 1 minute 30 seconds

    # Kill Chromium to free resources
    kill $CHROMIUM_PID 2>/dev/null
    wait $CHROMIUM_PID 2>/dev/null

    # Open Google Calendar
    open_url "$CALENDAR_URL"
    sleep 90  # 1 minute 30 seconds

    # Kill Chromium again
    kill $CHROMIUM_PID 2>/dev/null
    wait $CHROMIUM_PID 2>/dev/null
done
