#!/bin/env python3


def median(n, arr):
    temp = sorted(arr)
    mid = n // 2
    if n % 2 == 0:
        return (temp[mid-1] + temp[mid+1]) / 2
    else:
        return temp[mid]


def median2(n, arr):
    mid = n // 2
    if n % 2 == 0:
        # return (temp[mid-1] + temp[mid+1]) / 2
        mid += 1
        for i, v in enumerate(arr):
            mid -= v
            if mid == 0:
                return i
            elif mid > 0:
                return (i + i + 1) / 2
            else:
                return (i + i - 1) / 2

    else:
        mid += 1
        for i, v in enumerate(arr):
            mid -= v
            if mid <= 0:
                return i


def activity_notifications(expenditure, d):
    arr_length = len(expenditure)

    if arr_length <= d:
        return 0

    notifications = 0
    start = 0
    end = d
    sub = [0] * (arr_length + 1)
    for v in expenditure[start:end]:
        sub[v] += 1
    for i in range(d, arr_length):
        m = median2(d, sub)
        if expenditure[i] >= (2 * m):
            notifications += 1

        # slide the array

    return notifications


if __name__ == "__main__":
    n, d = input().strip().split(' ')
    n, d = [int(n), int(d)]
    expenditure = list(map(int, input().strip().split(' ')))
    result = activity_notifications(expenditure, d)
    print(result)
