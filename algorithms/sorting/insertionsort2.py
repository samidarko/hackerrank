#!/bin/env python3


def print_array(a):
    print(" ".join(map(str, a)))


def resort(i, arr):
    v = arr[i]
    while arr[i-1] > v and i > 0:
        arr[i] = arr[i-1]
        i -= 1
    arr[i] = v


def insertionSort2(n, arr):
    e = arr[0]
    p = 1
    while p < len(arr):
        if arr[p] < e:
            resort(p, arr)
        print_array(arr)
        e = arr[p]
        p += 1


if __name__ == "__main__":
    n = int(input().strip())
    arr = list(map(int, input().strip().split(' ')))
    insertionSort2(n, arr)
