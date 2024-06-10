local uh = "X"
function yomonk()

function hasWon(board, player)
    -- Check rows
    for i = 1, 3 do
        if board[i][1] == player and board[i][2] == player and board[i][3] == player then
            return true
        end
    end
    -- Check columns
    for i = 1, 3 do
        if board[1][i] == player and board[2][i] == player and board[3][i] == player then
            return true
        end
    end
    -- Check diagonals
    if board[1][1] == player and board[2][2] == player and board[3][3] == player then
        return true
    end
    if board[1][3] == player and board[2][2] == player and board[3][1] == player then
        return true
    end
    return false
end

-- Function to check if the board is full
function isBoardFull(board)
    for i = 1, 3 do
        for j = 1, 3 do
            if board[i][j] == " " then
                return false
            end
        end
    end
    return true
end

-- Function to evaluate the board for the AI
function evaluate(board, playerToWin)
    local opponent = switchPlayer(playerToWin)
    if hasWon(board, playerToWin) then
        return 10
    elseif hasWon(board, opponent) then
        return -10
    else
        return 0
    end
end

-- Function to switch player
function switchPlayer(player)
    if player == "X" then
        return "O"
    else
        return "X"
    end
end

-- Function to find the best move for the AI
function findBestMove(board, playerToWin)
    local bestScore = -math.huge
    local move = {}
    for i = 1, 3 do
        for j = 1, 3 do
            if board[i][j] == " " then
                board[i][j] = playerToWin
                local score = minimax(board, 0, false, playerToWin, playerToWin)
                board[i][j] = " "
                if score > bestScore then
                    bestScore = score
                    move = {i, j}
                end
            end
        end
    end
    return move
end

-- Minimax algorithm with alpha-beta pruning
function minimax(board, depth, isMaximizing, playerToWin, currentPlayer)
    local opponent = switchPlayer(playerToWin)

    if hasWon(board, playerToWin) then
        return 10 - depth
    elseif hasWon(board, opponent) then
        return -10 + depth
    elseif isBoardFull(board) then
        return 0
    end

    if isMaximizing then
        local bestScore = -math.huge
        for i = 1, 3 do
            for j = 1, 3 do
                if board[i][j] == " " then
                    board[i][j] = playerToWin
                    local score = minimax(board, depth + 1, false, playerToWin, opponent)
                    board[i][j] = " "
                    bestScore = math.max(bestScore, score)
                end
            end
        end
        return bestScore
    else
        local bestScore = math.huge
        for i = 1, 3 do
            for j = 1, 3 do
                if board[i][j] == " " then
                    board[i][j] = opponent
                    local score = minimax(board, depth + 1, true, playerToWin, playerToWin)
                    board[i][j] = " "
                    bestScore = math.min(bestScore, score)
                end
            end
        end
        return bestScore
    end
end




function gettic(thing)
local ya = game:GetService("Players").LocalPlayer.PlayerGui.GameRooms.TicTacToe.TicTacToeShow.TicTacToeMatrix[thing].Text

if ya == "" then

ya = " "
end
return ya
end



local board = {
    {gettic("1_1"), gettic("1_2"), gettic("1_3")},
    {gettic("2_1"), gettic("2_2"), gettic("2_3")},
    {gettic("3_1"), gettic("3_2"), gettic("3_3")}
}

local playerToWin = uh

local move = findBestMove(board, playerToWin)
game:GetService("CoreGui").TurtleUiLib.UiWindow.Header.Window.Label.Text = ("Best Move: X: (" .. move[2] .. ", Y: " .. move[1] .. ")")

end


function doting()
-- Configuration
local mainCharacter = uh
print(uh)
-- Function to check if a player has won
local function checkWin(board, player)
    -- Horizontal check
    for row = 1, 6 do
        for col = 1, 4 do
            if board[row][col] == player and
               board[row][col+1] == player and
               board[row][col+2] == player and
               board[row][col+3] == player then
                return true
            end
        end
    end
    -- Vertical check
    for col = 1, 7 do
        for row = 1, 3 do
            if board[row][col] == player and
               board[row+1][col] == player and
               board[row+2][col] == player and
               board[row+3][col] == player then
                return true
            end
        end
    end
    -- Diagonal check (top-left to bottom-right)
    for row = 1, 3 do
        for col = 1, 4 do
            if board[row][col] == player and
               board[row+1][col+1] == player and
               board[row+2][col+2] == player and
               board[row+3][col+3] == player then
                return true
            end
        end
    end
    -- Diagonal check (top-right to bottom-left)
    for row = 1, 3 do
        for col = 4, 7 do
            if board[row][col] == player and
               board[row+1][col-1] == player and
               board[row+2][col-2] == player and
               board[row+3][col-3] == player then
                return true
            end
        end
    end
    return false
end

-- Function to evaluate the score of a move
local function evaluateMove(board, column, player)
    local tempBoard = {} -- Create a copy of the board to simulate the move
    for i = 1, 6 do
        tempBoard[i] = {}
        for j = 1, 7 do
            tempBoard[i][j] = board[i][j]
        end
    end
    -- Simulate the move
    for row = 6, 1, -1 do
        if tempBoard[row][column] == " " then
            tempBoard[row][column] = player
            break
        end
    end
    -- Check if the move leads to a win for the player
    if checkWin(tempBoard, player) then
        return math.huge
    end
    -- Check if the move leads to a win for the opponent
    if checkWin(tempBoard, mainCharacter == "X" and "O" or "X") then
        return -math.huge
    end
    -- Return a heuristic score for the move
    -- You can define your own heuristic here
    return 0
end

-- Function to find the best move for the AI
local function findBestMove(board, depth, maximizingPlayer)
    local bestScore = maximizingPlayer and -math.huge or math.huge
    local bestMove = nil
    if depth == 0 then
        return evaluateMove(board, nil, mainCharacter), nil
    end
    for column = 1, 7 do
        if board[1][column] == " " then -- Check if the column is not full
            local row = 1
            while row < 6 and board[row+1][column] == " " do
                row = row + 1
            end
            local score = evaluateMove(board, column, maximizingPlayer and mainCharacter or (mainCharacter == "X" and "O" or "X"))
            if maximizingPlayer then
                if score > bestScore then
                    bestScore = score
                    bestMove = column
                end
            else
                if score < bestScore then
                    bestScore = score
                    bestMove = column
                end
            end
        end
    end
    return bestScore, bestMove
end


function getYY(column, row)
    U = {"X", "O"}
    return U[math.random(#U)]
end


function get(column, row)
    if game:GetService("Players").LocalPlayer.PlayerGui.GameRooms.Connect4.Connect4Show.Connect4Matrix["Column_"..column].Rows["Row_"..row].TextLabel.BackgroundColor3 == Color3.fromRGB(0,85,255) then
        return "O"
    elseif game:GetService("Players").LocalPlayer.PlayerGui.GameRooms.Connect4.Connect4Show.Connect4Matrix["Column_"..column].Rows["Row_"..row].TextLabel.BackgroundColor3 == Color3.fromRGB(255,0,0) then

        return "X"
    end
    return " "
end

local board = {
    {get(1,6), get(2,6), get(3,6), get(4,6), get(5,6), get(6,6), get(7,6)},
    {get(1,5), get(2,5), get(3,5), get(4,5), get(5,5), get(6,5), get(7,5)},
    {get(1,4), get(2,4), get(3,4), get(4,4), get(5,4), get(6,4), get(7,4)},
    {get(1,3), get(2,3), get(3,3), get(4,3), get(5,3), get(6,3), get(7,3)},
    {get(1,2), get(2,2), get(3,2), get(4,2), get(5,2), get(6,2), get(7,2)},
    {get(1,1), get(2,1), get(3,1), get(4,1), get(5,1), get(6,1), get(7,1)}
}


local depth = 4 -- Adjust the depth of the search
local bestScore, bestMove = findBestMove(board, depth, true)
game:GetService("CoreGui").TurtleUiLib.UiWindow.Header.Window.Label.Text = tostring(bestMove)

end

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/miroeramaa/TurtleLib/main/TurtleUiLib.lua"))()
local window = library:Window("Window")

window:Label("Column", Color3.fromRGB(25, 219, 240))


window:Button("Highlight Kill Door (Kill Game)", function()
   for i,v in pairs(game.Workspace:GetDescendants()) do
if v.Name == "Door1" or v.Name == "Door2" then
if v:FindFirstChild("TouchInterest") then
v.Color = Color3.fromRGB(255,255,255)
else
if v.Color == Color3.fromRGB(255,255,255) then
v.Color = Color3.fromRGB(255,0,0)
end
end
end
end
end)

window:Box("Your Team", function(text, focuslost)
   if text:upper() == "X" then
uh = "X"
elseif text:upper() == "O" then
uh = "O"
end

end)
window:Button("Predict (Tic-Tac-Toe)", function()
yomonk()
end)
window:Button("Predict (Connect4)", function()
doting()
end)

