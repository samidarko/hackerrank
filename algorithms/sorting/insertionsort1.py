#!//usr/bin/python3


def print_array(a):
    print(" ".join(map(str, a)))


def insertionSort1(n, arr):
    # Complete this function
    e = arr[-1]
    i = len(arr) - 1
    while arr[i-1] > e and i > 0:
        arr[i] = arr[i-1]
        i -= 1
    arr[i] = e
    print_array(arr)


if __name__ == "__main__":
    n = int(input().strip())
    arr = list(map(int, input().strip().split(' ')))
    insertionSort1(n, arr)
