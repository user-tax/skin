#!/usr/bin/env coffee

> ./config/svg.var:svg_var
import styl2css from './config/style2css'
import walk from '@iuser/walk'
import {join,dirname} from 'path'
import {ROOT} from './config/env'
import {rm, writeFile, mkdir} from 'fs/promises'
import {existsSync} from 'fs'

SKIN = 'skin'
export default main = =>
  await svg_var()

  skin = join ROOT,SKIN
  len = skin.length+1

  out = join ROOT,'lib'
  await rm out, recursive: true, force: true
  li = [out]

  ui = join dirname(ROOT),'ui/lib/skin'
  if existsSync(ui)
    li.push ui

  for await i from walk skin
    name = i[len..-5]
    try
      css = await styl2css i
    catch err
      console.error i
      throw err
    if css.length
      name+='css'
      console.log name
      for dir in li
        fp = join dir, name
        await mkdir dirname(fp), recursive: true
        await writeFile fp, css

if process.argv[1] == decodeURI (new URL(import.meta.url)).pathname
  await main()
  console.log ''
  process.exit()
