#!/usr/bin/env python3

import os
import pywal

image_path = "/home/xavier/Desktop/conesque/sddm/wal.jpg"
custom_cache_dir = "/home/xavier/.cache/wal/sddm/"

os.makedirs(custom_cache_dir, exist_ok=True)

# ignore cached colors
colors = pywal.colors.get(image_path, cache_dir=custom_cache_dir)
pywal.export.color(colors, "/home/xavier/.config/wal/templates/Colors.qml", os.path.join(custom_cache_dir, "Colors.qml"))

