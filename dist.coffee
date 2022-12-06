#!/usr/bin/env coffee

import 'zx/globals'
import thisdir from '@rmw/thisdir'
import {dirname} from 'path'

ROOT = thisdir(import.meta)
cd ROOT

await $'./sh/svg-compress.sh'

await $'NODE_ENV=production ./build.coffee'
