# Resize Images

## A simple shell script to resize all images in a folder structure.

### Requirements

Works in Linux-based environments. Requires [imagemagick](https://imagemagick.org/index.php):
```
apt-get install imagemagick
```
On Mac OS:
```
brew install imagemagick
```

### Usage

To run system-wide, install in your executables path, i.e.
```
cp resize_images.sh /usr/local/bin/resize_images
```
General usage:
```
resize_images [[folder] [size]]
```
Script will clone, then traverse `[folder]`, resizing all JPEGs and PNGs so the largest dimension is `[size]` pixels, preserving aspect ratio and saving the result as `[folder]_resized-[size]`.
```
resize_images my_big_ones/ 640
```
will resize all images in the `my_big_ones` folder to largest dimension 640px, saving the result to `my_big_ones_resized-640`.
```
If arguments are omitted, they will be prompted for.
