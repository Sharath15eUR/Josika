# Advance C Programming - Assignments

## Topic 1: Structures

### C Program: Weekly Calendar with Tasks

```c
#include <stdio.h>
#include <string.h>

#define MAX_TASKS 3
#define MAX_DAYS 7

// Structure to store a day and its tasks
struct Day {
    char dayName[10];
    char tasks[MAX_TASKS][50];
    int taskCount;
};

int main() {
    struct Day week[MAX_DAYS] = {
        {"Monday", {}, 0},
        {"Tuesday", {}, 0},
        {"Wednesday", {}, 0},
        {"Thursday", {}, 0},
        {"Friday", {}, 0},
        {"Saturday", {}, 0},
        {"Sunday", {}, 0}
    };

    int choice, i;
    char task[50];

    while (1) {
        printf("\nMenu:\n");
        printf("1. Add Task\n");
        printf("2. Show All Tasks\n");
        printf("3. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);

        if (choice == 1) {
            printf("\nSelect a day (0=Mon, 1=Tue, ..., 6=Sun): ");
            scanf("%d", &i);

            if (i >= 0 && i < MAX_DAYS) {
                if (week[i].taskCount < MAX_TASKS) {
                    printf("Enter task: ");
                    scanf(" %[^"]", task); // Read full line
                    strcpy(week[i].tasks[week[i].taskCount], task);
                    week[i].taskCount++;
                } else {
                    printf("Maximum tasks reached for %s.\n", week[i].dayName);
                }
            } else {
                printf("Invalid day index.\n");
            }

        } else if (choice == 2) {
            printf("\n--- Weekly Tasks ---\n");
            for (i = 0; i < MAX_DAYS; i++) {
                printf("%s:\n", week[i].dayName);
                if (week[i].taskCount == 0) {
                    printf("  No tasks.\n");
                } else {
                    for (int j = 0; j < week[i].taskCount; j++) {
                        printf("  - %s\n", week[i].tasks[j]);
                    }
                }
            }
        } else if (choice == 3) {
            break;
        } else {
            printf("Invalid choice.\n");
        }
    }

    return 0;
}
```

---

## Topic 2: Pointers

### C Program: Rearrange Array (Even before Odd) Using Pointers

```c
#include <stdio.h>

// Function to rearrange the array in-place using only pointer arithmetic
void rearrangeEvenBeforeOdd(int *arr, int size) {
    for (int *i = arr; i < arr + size; i++) {
        if (*i % 2 == 0) {
            int even = *i;
            int *j = i;

            // Move the even element left past any previous odd numbers
            while (j > arr && (*(j - 1) % 2 != 0)) {
                *j = *(j - 1);  // Shift odd number to the right
                j--;
            }

            *j = even;  // Place even in the correct position
        }
    }
}

// Function to print the array using pointer arithmetic
void printArray(int *arr, int size) {
    for (int *p = arr; p < arr + size; p++) {
        printf("%d ", *p);
    }
    printf("\n");
}

// Main function
int main() {
    int arr[] = {3, 2, 4, 1, 5, 6};
    int size = sizeof(arr) / sizeof(arr[0]);

    printf("Original array:\n");
    printArray(arr, size);

    rearrangeEvenBeforeOdd(arr, size);

    printf("Rearranged array (even before odd, order preserved):\n");
    printArray(arr, size);

    return 0;
}
```

---

## Topic 3: Arrays

### C Program: Efficient Search in a Sorted 2D Matrix

```c
#include <stdio.h>
#include <stdbool.h>

// Function to search the key in the matrix
bool searchMatrix(int matrix[][3], int n, int key) {
    int row = 0;
    int col = n - 1;  // Start from top-right corner

    while (row < n && col >= 0) {
        if (matrix[row][col] == key)
            return true;
        else if (matrix[row][col] > key)
            col--;  // Move left
        else
            row++;  // Move down
    }

    return false;  // Key not found
}

// Main function
int main() {
    int N = 3;  // Matrix size (3x3)
    int matrix[3][3] = {
        {10, 20, 30},
        {15, 25, 35},
        {27, 29, 37}
    };

    int key = 10;

    if (searchMatrix(matrix, N, key))
        printf("Key %d found in the matrix.\n", key);
    else
        printf("Key %d not found in the matrix.\n", key);

    return 0;
}
```

---

