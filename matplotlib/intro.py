"""
    Basic plot: line / scatter / histogram
    
        plt.plotfunc() => plt... aesthetics => plt.show()

"""

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

iris = pd.read_csv("C://Users//Bangda//Desktop//iris.csv", index_col = 0)
iris.head()

### Scatter plot
pLength = iris['Petal.Length']
pWidth  = iris['Petal.Width']
plt.scatter(pLength, pWidth, c = 'b', alpha = 1./5)
plt.xlabel('Petal Length')
plt.ylabel('Petal Width')
plt.title('Scatter plot of length and width of Petal')
plt.grid(True)
plt.show()
plt.clf()

### Histogram
n, bins, patches = plt.hist(pWidth, bins = 20, color = 'g', alpha = 0.75, normed = True) # convert to np.array if doesn't work
plt.xlabel('Petal width')
plt.title('Distribution of petal width')
plt.grid(True)
plt.show()
plt.clf()

### with pandas
### Plotting on date directly (series)
np.random.seed(1234)
s = pd.Series(np.random.randn(10).cumsum(), index = np.arange(0, 100, 10))
s.plot(kind = 'line', color = 'red', linestyle = 'solid', marker = 'o', grid = True, alpha = 0.75, 
       xticks = [0, 15, 30, 45, 60, 75, 90], ylim = [-2, 2], label = 'series\ndata')
plt.legend(loc = 'upper left')

x = pd.Series(np.random.normal(0, 4, 1000))
plt.figure(figsize = (8, 6))  # horizontal, vertical
plt.subplot(2,2,1)
x.plot(kind = 'hist', color = 'green', grid = True, alpha = .75, bins = 30, xticks = np.arange(-12, 14, 4), label = 'bins = 30')
plt.legend(loc = 'upper left')
plt.subplot(2,2,2)
x.plot(kind = 'hist', color = 'green', grid = True, alpha = .75, bins = 50, xticks = np.arange(-12, 14, 4), label = 'bins = 50')
plt.legend(loc = 'upper left')
plt.subplot(2,2,3)
x.plot(kind = 'hist', color = 'green', grid = True, alpha = .75, bins = 75, xticks = np.arange(-12, 14, 4), label = 'bins = 75')
plt.legend(loc = 'upper left')
plt.subplot(2,2,4)
x.plot(kind = 'hist', color = 'green', grid = True, alpha = .75, bins = 100, xticks = np.arange(-12, 14, 4), label = 'bins = 100')
plt.legend(loc = 'upper left')
plt.subplots_adjust(wspace = .3, hspace = 0.2)  # horizontal, vertical

### Plotting in data frame
np.random.seed(1000)
df = pd.DataFrame(np.random.randn(20, 4).cumsum(0),
                 columns = ['A', 'B', 'C', 'D'],
                 index = np.arange(0, 100, 5))
df.plot(style = 'o-', grid = True)

df.plot(kind = 'bar', stacked = True)

#   correlation matrix
pd.scatter_matrix(df, diagonal = 'hist')

#   box plot
df.plot(kind = 'box', subplots = True, legend = True)

#   set subplots
df.plot(kind = 'line', subplots = True, marker = 'o', legend = False)

#   alternative way
fig, axes = plt.subplots(nrows=2, ncols=1)
df[['A']].plot(ax = axes[0], kind = 'hist', bins = 30, normed = True)
df[['A']].plot(ax = axes[1], kind = 'hist', bins = 30, normed = True, cumulative = True)
