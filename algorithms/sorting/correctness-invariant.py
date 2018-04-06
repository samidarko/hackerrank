#!/bin/env python3


def insertion_sort(arr):
    for i in range(1, len(arr)):
        j = i-1
        key = arr[i]
        while (j >= 0) and (arr[j] > key):
            arr[j+1] = arr[j]
            j -= 1
        arr[j+1] = key


m = int(input().strip())
ar = [int(i) for i in input().strip().split()]
insertion_sort(ar)
print(" ".join(map(str, ar)))
