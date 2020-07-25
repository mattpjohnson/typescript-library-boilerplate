import fetch from 'node-fetch'
import lodash from 'lodash'

const KEY = '2a3c641ac429d565efc1d2a29480d954'
const TOKEN = 'a79a0a2ed5fa51fb00cea017774c8bd2aec9bf322087e16f210dd3d8b84da9d0'
const trelloBoardUrl = (board: string) =>
  `https://api.trello.com/1/boards/${board}/cards?key=${KEY}&token=${TOKEN}`

type TrelloCard = {
  name: string
  desc?: string
}

export async function search(
  boards: string[],
  text: string
): Promise<TrelloCard[]> {
  const cards = await download(boards)
  return cards.filter(card => TrelloUtils.card(card).matchesText(text))
}

async function download(boards: string[]): Promise<TrelloCard[]> {
  const cards = await Promise.all(boards.map(downloadCardsFromBoard))
  return cards.flat()
}

function downloadCardsFromBoard(board: string): Promise<TrelloCard[]> {
  return fetch(trelloBoardUrl(board)).then(response => response.json())
}

class TrelloUtils {
  static card(card: TrelloCard) {
    return {
      matchesText(text: string): boolean {
        return (
          card.name.toLowerCase().includes(text.toLowerCase()) ||
          lodash
            .get(card, 'desc', '')
            .toLowerCase()
            .includes(text.toLowerCase())
        )
      },
    }
  }
}
