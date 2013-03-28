UIImageResizer

This script takes a UIImage and downsizes it to a specified CGFloat.

This script figures out if the width of the image is greater than the height, and adjusts the resizing automatically to yield you a properly scaled square image at the center of the photo. This also works if the height is greater than the width.

The script uses Core Graphics to do the work.

This script build on top of Paul Lynch's solution from the following post: http://bit.ly/16k0lQf.