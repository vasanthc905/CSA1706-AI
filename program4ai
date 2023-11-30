import itertools

def solveCryptarithmetic(puzzle):
    words = puzzle.split()
    uniqueChars = set("".join(words))
    if len(uniqueChars) > 10:
        return "Invalid input: there are more than 10 unique characters in the puzzle."
    firstLetters = {word[0] for word in words}
    letters = "".join(firstLetters) + "".join(uniqueChars - firstLetters)
    digits = range(10)
    for permutation in itertools.permutations(digits, len(letters)):
        sol = dict(zip(letters, permutation))
        if all(sol[word[0]] != 0 for word in words):
            left = sum(sol[word[i]] * 10 ** (len(word) - 1 - i) for word in words for i in range(len(word)))
            right = sol[words[-1][-1]] * 10 ** (len(words[-1]) - 1)
            if left == right:
                return sol
    return "No solution found."


puzzle = "SEND + MORE = MONEY"
solution = solveCryptarithmetic(puzzle)
if isinstance(solution, dict):
    print("Solution found:")
    for word in puzzle.split():
        print(word, "=", "".join(str(solution[char]) for char in word))
else:
    print(solution)
