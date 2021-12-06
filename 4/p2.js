const fs = require("fs");
const input = fs.readFileSync(0).toString();

const lines = input.split("\n");

const nums = lines
  .splice(0, 1)[0]
  .split(",")
  .map((x) => parseInt(x));

const boards = [];

let board = [];
const marks = {};

// skip first line
for (let i = 1; i < lines.length; i++) {
  const l = lines[i];

  if (l === "") {
    // bookkeeping of marks
    marks[boards.length] = {
      rows: board[0].map((_) => 0), // hits per row
      cols: board[0].map((_) => 0), // hits per col
      marked: [], // marked cells
    };
    boards.push(board);
    board = [];
    continue;
  }

  board.push(
    l
      .trim()
      .split(/\s+/)
      .map((x) => parseInt(x))
  );
}

const marked = [];
let lastWinningNum;
let lastWinningBoard;
let winningBoardIndexes = new Set();

for (const n of nums) {
  boards: for (let bi = 0; bi < boards.length; bi++) {
    if (winningBoardIndexes.has(bi)) {
      continue;
    }

    const b = boards[bi];
    for (let ri = 0; ri < b.length; ri++) {
      for (let ci = 0; ci < b[ri].length; ci++) {
        if (b[ri][ci] === n) {
          marks[bi].rows[ri] += 1;
          marks[bi].cols[ci] += 1;
          marks[bi].marked.push([ri, ci]);

          if (marks[bi].rows[ri] === 5 || marks[bi].cols[ci] === 5) {
            lastWinningNum = n;
            lastWinningBoard = bi;
            winningBoardIndexes.add(bi);
            continue boards;
          }
        }
      }
    }
  }
}

let sum = 0;

const b = boards[lastWinningBoard];
const m = marks[lastWinningBoard];

const lookup = new Set(m.marked.map(([r, c]) => `${r}_${c}`));

for (let r = 0; r < b.length; r++) {
  for (let c = 0; c < b[r].length; c++) {
    if (!lookup.has(`${r}_${c}`)) {
      sum += b[r][c];
    }
  }
}

console.log(sum * lastWinningNum);
