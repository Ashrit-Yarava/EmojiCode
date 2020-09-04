#!/bin/bash
# Simple Script to make it easier to deploy flutter based web app.

cd application/
flutter build web
cd ..
mv application/build/web/ docs/