#!/usr/bin/env coffee

import {readFileSync} from 'fs'
import plugins from './postcss.plugin'
import {join} from 'path'
import postcss from 'postcss'
import {ROOT} from './env'

export default postcss [
  ...plugins
  {
    postcssPlugin: 'svg-inline'
    Declaration : (decl, postcss) =>
      {value} = decl
      # data:image/svg+xml;
      if value.indexOf('.svg') > 0
        decl.value = value.replace(
          /(?:^|\s)['"]([^\s]+\.svg)['"]/g
          (full,svg)=>
            svg = readFileSync join(ROOT,'svg',svg),'utf8'
            svg = svg.trim().replaceAll('#','%23')
            r = """ url('data:image/svg+xml;utf8,#{svg}')"""
            r
        )
      return
  }
]
