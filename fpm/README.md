# FPM/ #

This directory contains all of our code for building jsoncdc into a debian package. This code was
taken straight out of our internal build system, and modified to work with Makefiles. This is still
a long way from allowing anyone with any setup to build jsoncdc from scratch, but you should be
able to run this makefile if you can locally (without docker) build jsoncdc.

To build a package simply run:

```bash
make deploy
```
