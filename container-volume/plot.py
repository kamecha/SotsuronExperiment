# 箱ひげ図を出力するサンプル
# 引数
#   1: データファイル名
#      データはCSV形式。1行目にキー、2行目以降に値
#   2: 出力画像ファイル名
#      省略時は画像保存しない
#
import sys
import csv
import matplotlib.pyplot as plt

filepath = sys.argv[1]
if len(sys.argv) >= 3:
    imagepath = sys.argv[2]
else:
    imagepath = ""

csv_data = {}
labels = []

with open(filepath) as f:
    reader = csv.reader(f)
    labels = next(reader)
    for label in labels:
        csv_data[label] = []
    for row in reader:
        for i, item in enumerate(row):
            if item != '':
                csv_data[labels[i]].append(float(item))

data = []
for key in labels:
    data.append(csv_data[key])

fig, ax = plt.subplots()

plt.boxplot(data, labels=labels)
plt.title('Box plot')
plt.xlabel('key')
plt.ylabel('value')

plt.show()

if imagepath != "":
    fig.savefig(imagepath)
