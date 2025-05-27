
# Multithreaded C Program with Signal Handling

## Program Description

This C program creates three threads:

- **Thread A**: Calculates the sum of the first N prime numbers.
- **Thread B**: Prints "Thread 1 running" every 2 seconds for 100 seconds.
- **Thread C**: Prints "Thread 2 running" every 3 seconds for 100 seconds.

It also handles `SIGINT` (Ctrl+C) and prevents the program from terminating when this signal is caught.

---

```c
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>
#include <stdbool.h>
#include <time.h>
#include <signal.h>

volatile sig_atomic_t sigint_received = 0;

void handle_sigint(int sig) {
    sigint_received = 1;
    printf("\nSIGINT caught! Termination prevented. Keep running...\n");
}

void print_time(const char *prefix) {
    time_t now = time(NULL);
    struct tm *t = localtime(&now);
    char buf[20];
    strftime(buf, sizeof(buf), "%H:%M:%S", t);
    printf("[%s] %s\n", buf, prefix);
}

bool isPrime(int num) {
    if (num <= 1) return false;
    if (num == 2) return true;
    if (num % 2 == 0) return false;
    for (int i = 3; i * i <= num; i += 2) {
        if (num % i == 0) return false;
    }
    return true;
}

typedef struct {
    int N;
    long long sum;
    double time_taken;
} ThreadAData;

void* threadA_func(void* arg) {
    ThreadAData* data = (ThreadAData*)arg;
    time_t start = time(NULL);
    int count = 0, num = 2;
    long long sum = 0;

    print_time("Thread A started");

    while (count < data->N) {
        if (isPrime(num)) {
            sum += num;
            count++;
        }
        num++;
    }

    data->sum = sum;
    time_t end = time(NULL);
    data->time_taken = difftime(end, start);

    print_time("Thread A finished");
    pthread_exit(NULL);
}

void* threadB_func(void* arg) {
    time_t start = time(NULL);
    print_time("Thread B started");

    while (difftime(time(NULL), start) < 100) {
        printf("Thread 1 running\n");
        sleep(2);
        if (sigint_received) {
            printf("Thread B noticed SIGINT but continuing...\n");
            sigint_received = 0;
        }
    }

    print_time("Thread B finished");
    pthread_exit(NULL);
}

void* threadC_func(void* arg) {
    time_t start = time(NULL);
    print_time("Thread C started");

    while (difftime(time(NULL), start) < 100) {
        printf("Thread 2 running\n");
        sleep(3);
        if (sigint_received) {
            printf("Thread C noticed SIGINT but continuing...\n");
            sigint_received = 0;
        }
    }

    print_time("Thread C finished");
    pthread_exit(NULL);
}

int main() {
    struct sigaction sa;
    sa.sa_handler = handle_sigint;
    sigemptyset(&sa.sa_mask);
    sa.sa_flags = 0;
    sigaction(SIGINT, &sa, NULL);

    int N;
    printf("Enter N (number of prime numbers to sum): ");
    scanf("%d", &N);

    pthread_t threadA, threadB, threadC;
    ThreadAData data;
    data.N = N;
    data.sum = 0;
    data.time_taken = 0.0;

    pthread_create(&threadA, NULL, threadA_func, &data);
    pthread_create(&threadB, NULL, threadB_func, NULL);
    pthread_create(&threadC, NULL, threadC_func, NULL);

    pthread_join(threadA, NULL);
    printf("Sum of first %d prime numbers = %lld\n", N, data.sum);
    printf("Thread A time taken: %.2f seconds\n", data.time_taken);

    pthread_join(threadB, NULL);
    pthread_join(threadC, NULL);

    printf("All threads completed.\n");
    return 0;
}
```

---

### 1. Child Process - `fork()`

- `fork()` creates a child process that runs independently from the parent.
- Child and parent continue execution after the `fork()` call.
- Useful for parallel processing and executing new programs.

### 2. Handling Common Signals

- Signals notify a process of asynchronous events (e.g., `SIGINT`, `SIGTERM`, `SIGKILL`, `SIGSEGV`).
- `signal()` and `sigaction()` are used to define custom handlers.
- Good signal handling ensures graceful recovery or shutdown.

### 3. Exploring Kernel Crashes

- Kernel crashes cause system-wide failures like panics or reboots.
- Common causes: null pointers, race conditions, driver bugs, memory issues.
- Debugging involves logs, `kdump`, `crash`, and analyzing stack traces.

### 4. Time Complexity

- Measures algorithm efficiency relative to input size.
- Common notations:
  - O(1): Constant time
  - O(n): Linear
  - O(log n): Logarithmic
  - O(n^2): Quadratic
- Helps in choosing optimal algorithms for large-scale data.

### 5. Locking Mechanism - Mutex vs Spinlock

- **Mutex**:
  - Blocking lock, used when wait time is longer.
  - Thread sleeps if lock is unavailable.
- **Spinlock**:
  - Non-blocking (busy-wait) lock.
  - Best for short critical sections.
- Both prevent race conditions in multithreaded programs.

---

## Output Example

```
Enter N (number of prime numbers to sum): 10
[12:00:00] Thread A started
[12:00:00] Thread B started
[12:00:00] Thread C started
Thread 1 running
Thread 2 running
...
[12:00:01] Thread A finished
Sum of first 10 prime numbers = 129
Thread A time taken: 1.00 seconds
...
All threads completed.
```

