export * from './sum'
export * from './product'
import { search } from './trello'

async function main() {
  console.log(await search(['4Js5uaXP'], 'automated'))
}

main()
