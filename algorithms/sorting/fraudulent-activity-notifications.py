#!/bin/env python3


def median(n, arr):
    temp = sorted(arr)
    mid = n // 2
    if n % 2 == 0:
        return (temp[mid-1] + temp[mid+1]) / 2
    else:
        return temp[mid]


def activity_notifications(expenditure, d):
    arr_length = len(expenditure)

    if arr_length <= d:
        return 0

    notifications = 0
    for i in range(d, arr_length):
        start = i - d
        end = start + d
        m = median(d, expenditure[start:end])
        if expenditure[i] >= (2 * m):
            notifications += 1

    return notifications


if __name__ == "__main__":
    n, d = input().strip().split(' ')
    n, d = [int(n), int(d)]
    expenditure = list(map(int, input().strip().split(' ')))
    result = activity_notifications(expenditure, d)
    print(result)
