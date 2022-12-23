# Scripts for Generating `scipy` + `numpy` dependencies that can work in a Lambda Layer

`numpy` and `scipy` especially are very large libraries when installed directly
from `pip`, usually coming in at over 250 MB together. This is generally [too
large](https://docs.aws.amazon.com/lambda/latest/dg/gettingstarted-limits.html)
to fit into a Lambda Function deployment package.

This builds upon the [excellent work](https://github.com/szelenka/shrink-linalg)
by @szelenka to produce a much smaller build from source of the two libraries
and packages them up as a Lambda Layer with the required dependencies.

## Prerequisites

* Docker

## Usage

To create a deployment package for your layer, you can simply run:

```
./make_layer.sh
```

This will start a Docker container based on the official AWS [SAM Build
Images](https://github.com/aws/aws-sam-build-images) that will compile stripped
down versions of scipy and numpy. Note that compilation may take some time.

The output of the script is a ZIP file named `scipy-1.8.1_numpy-1.23.0.zip`.
This ZIP file is a fully-prepared deployment package for a Lambda Layer and can
be deployed as-is using [your preferred
method](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html).
