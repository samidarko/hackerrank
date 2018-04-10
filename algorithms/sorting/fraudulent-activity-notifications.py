#!/bin/env python3


def median(n, arr):
    mid = n // 2
    if n % 2 == 0:
        temp = None
        for i, v in enumerate(arr):
            mid -= v
            if mid < 0 and temp is not None:
                return (i + temp) / 2
            if mid < 0 and v >= 2:
                return i
            if mid == 0 and temp is None:
                temp = i
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
    sub = [0] * (200 + 1)
    for v in expenditure[start:end]:
        sub[v] += 1

    for i in range(d, arr_length):
        m = median(d, sub)
        if expenditure[i] >= (2 * m):
            notifications += 1

        # slide the array
        sub[expenditure[start]] -= 1
        start += 1
        end += 1
        if end < arr_length:
           sub[expenditure[end]] += 1

    return notifications


if __name__ == "__main__":
    n, d = input().strip().split(' ')
    n, d = [int(n), int(d)]
    expenditure = list(map(int, input().strip().split(' ')))
    result = activity_notifications(expenditure, d)
    print(result)
