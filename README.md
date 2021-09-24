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
Script will clone, then traverse `[folder]`, resizing all JPEGs and PNGs so the largest dimension is `[size]` pixels, preserving aspect ratio and saving the result as `[folder]_resized-[size]`. The original folder is left untouched. Imagemagick's `convert` does not upscale, so any images in the folder smaller than the target width will be ignored.

### Example

```
resize_images my_images/ 640
```
will resize all images in the `my_images` folder to largest dimension 640px, saving the result to `my_images_resized-640`.

If arguments are omitted, they will be prompted for.

