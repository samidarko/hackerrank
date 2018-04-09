#!/bin/env python3
# https://www.hackerrank.com/challenges/countingsort2/problem


def counting_sort(arr):
    m = max(arr) + 1
    temp = [0] * m
    for v in arr:
        temp[v] += 1
    result = []
    for i, v in enumerate(temp):
        result += [i] * v
    return result


if __name__ == "__main__":
    n = int(input().strip())
    arr = list(map(int, input().strip().split(' ')))
    result = counting_sort(arr)
    print(" ".join(map(str, result)))
