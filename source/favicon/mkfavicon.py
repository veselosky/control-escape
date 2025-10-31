#!/usr/bin/env python3
# /// script
# requires-python = ">=3.13"
# dependencies = [
#     "pillow>=8.4.0",
# ]
# ///
"""
Generate a favicon.ico file with a specified glyph centered on it.
Requires Pillow (PIL fork) to be installed.
NOTE: This worked reasonably well, but I decided to go with the tool at
https://realfavicongenerator.net/ instead, as it creates a more complete set of
favicon files for various platforms.
"""

from PIL import Image, ImageDraw, ImageFont

# ----- settings you can tweak -----
glyph = "⎋"  # U+238B
font_path = "/usr/share/fonts/truetype/noto/NotoSansSymbols-Regular.ttf"
font_size = 128
# Use RGB from the start: white background, black glyph
bg_color = (255, 255, 255)  # white background
fg_color = (0, 0, 0)  # black symbol
canvas_size = 128  # we'll downscale to favicon sizes
# ----------------------------------

# create RGB canvas (square) with a white background so the ICO entries
# are written as BMP (uncompressed) rather than PNG-compressed images.
img = Image.new("RGB", (canvas_size, canvas_size), bg_color)
draw = ImageDraw.Draw(img)

# load font
font = ImageFont.truetype(font_path, font_size)

# measure text bounding box
bbox = draw.textbbox((0, 0), glyph, font=font)
text_w = bbox[2] - bbox[0]
text_h = bbox[3] - bbox[1]

# center the glyph on the canvas
x = (canvas_size - text_w) / 2 - bbox[0]
y = (canvas_size - text_h) / 2 - bbox[1]

draw.text((x, y), glyph, font=font, fill=fg_color)

# Save as ICO. Because the image is RGB (no alpha), Pillow will write BMP
# formatted icon entries instead of PNG-compressed entries.
img.save(
    "favicon.ico",
    format="ICO",
    bitmap_format="bmp",
    sizes=[(16, 16), (32, 32), (48, 48), (64, 64)],
)

print("wrote favicon.ico")
