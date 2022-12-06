#!/usr/bin/env coffee

> @rmw/thisdir
  path > join dirname

export ROOT = dirname thisdir(import.meta)
export STYL = join ROOT, 'styl'
export SKIN = join ROOT, 'skin'

