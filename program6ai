import random

class VacuumCleaner:
    def __init__(self, rows, cols):
        self.rows = rows
        self.cols = cols
        self.location = (random.randint(0, rows - 1), random.randint(0, cols - 1))
        self.direction = random.choice(['up', 'down', 'left', 'right'])
        self.environment = [[random.choice([0, 1]) for _ in range(cols)] for _ in range(rows)]

    def display_environment(self):
        for row in self.environment:
            print(row)
        print()

    def clean(self):
        while any(1 in row for row in self.environment):
            self.display_environment()
            self.clean_current_location()
            self.move()

        print("Cleaning complete!")

    def clean_current_location(self):
        row, col = self.location
        if self.environment[row][col] == 1:
            print(f"Cleaning dirt at location {self.location}")
            self.environment[row][col] = 0
        else:
            print(f"No dirt at location {self.location}")

    def move(self):
        row, col = self.location

        if self.direction == 'up':
            if row > 0:
                self.location = (row - 1, col)
            else:
                self.direction = 'down'
        elif self.direction == 'down':
            if row < self.rows - 1:
                self.location = (row + 1, col)
            else:
                self.direction = 'up'
        elif self.direction == 'left':
            if col > 0:
                self.location = (row, col - 1)
            else:
                self.direction = 'right'
        elif self.direction == 'right':
            if col < self.cols - 1:
                self.location = (row, col + 1)
            else:
                self.direction = 'left'


if __name__ == "__main__":
    rows = 3
    cols = 3
    vacuum = VacuumCleaner(rows, cols)
    vacuum.clean()
