#!/bin/env python3
# https://www.hackerrank.com/challenges/countingsort1/problem


def counting_sort(arr):
    m = max(arr) + 1
    temp = [0] * m
    for v in arr:
        temp[v] += 1
    return temp


if __name__ == "__main__":
    n = int(input().strip())
    arr = list(map(int, input().strip().split(' ')))
    result = counting_sort(arr)
    print(" ".join(map(str, result)))
