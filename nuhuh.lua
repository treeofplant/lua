-- Configuration
local mainCharacter = getgenv().Lo
print("1")
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


function get(column, row)
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
