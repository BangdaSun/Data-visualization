
# coding: utf-8

# ## Discussions on Matplotlib 
# https://www.datacamp.com/courses/intro-to-python-for-data-science

# Get data and load packages

# In[1]:

import os
import numpy as np
import pandas as pd
import matplotlib as mpl
import matplotlib.pyplot as plt
get_ipython().magic(u'matplotlib inline')
os.chdir('C:/Users/Bangda/Desktop/kaggle/housing-price')
mydata = pd.read_csv('train.csv')


#### 1. Line plot and scatter plot

# (1) Plotting *SalePrice* versus *Id*:
# * subplot
# * xlabel, ylabel, title
# * color

# In[2]:

mpl.rcParams['figure.figsize'] = (18, 8)
plt.subplot(1, 2, 1)
plt.plot(mydata.loc[:200, 'Id'], np.log(mydata.loc[:200, 'SalePrice']), 
         color = '#F8766D')
plt.xlabel('Id')
plt.ylabel('logSalePrice')
plt.title('First 200 Ids')
plt.subplot(1, 2, 2)
plt.plot(mydata.loc[201:400, 'Id'], np.log(mydata.loc[201:400, 'SalePrice']), 
         color = '#00BFC4')
plt.xlabel('Id')
plt.ylabel('logSalePrice')
plt.title('201 to 400 Ids')
plt.show()


# (2) Plotting *logGrLivArea* and *logSalePrice*
# * alpha
# * color
# * size
# * grid
# * text

# In[3]:

mpl.rcParams['figure.figsize'] = (10, 6)
plt.scatter(np.log(mydata['LotArea']), np.log(mydata['SalePrice']), 
            alpha = .2, color = 'blue', s = 40)
plt.grid(True)
plt.text(11, 11, 'logLotArea vs logSalePrice')
plt.show()


#### 2. Histogram

# (1) Histogram of *logSalePrice*
# * bins
# * color
# * edgeColor
# * axes ticks

# In[4]:

mpl.rcParams['figure.figsize'] = (10, 5.5)
x, bins, patches = plt.hist(np.log(mydata['SalePrice']), bins = 40, 
                            color = 'green', edgeColor = 'k')
plt.xticks(np.arange(10, 14, 0.2))
plt.show()


# ### 3. Based on pandas DataFrames
# 
# `.plot()` method with params:
# * `subplots = True/False`
# * `kind = 'scatter'/'box'/'hist'`:
#   * for `scatter` we need at least specify `x = ` and `y = `; 
#   * for `hist` there are also `bins`, `range`, `normed = True/False`, `cumulative = True/False`
# 
# `plt.show()`

# In[5]:

mpl.style.use('ggplot')


# #### (1) Scatter plot
# 
# With aesthestics `alpha` and `color`

# In[6]:

mydata.loc[:, ['OverallQual', 'LotArea', 'SalePrice']].plot(
    kind = 'scatter', x = 'LotArea', y = 'SalePrice', alpha = 0.3, c = 'OverallQual')
plt.show()


##### (2) Line plot

# In[7]:

mpl.rcParams['figure.figsize'] = (10, 8)
mydata.loc[:100, ['GrLivArea', 'LotArea', 'SalePrice', 'TotalBsmtSF']].plot(kind = 'line', subplots = True, layout = (2, 2))
plt.show()


##### (3) Histogram

# In[8]:

mydata['logSalePrice'] = np.log(mydata['SalePrice'])
mydata['SalePrice'].plot(kind = 'hist', bins = 50)
myhist = mydata[['SalePrice', 'logSalePrice']].hist(layout = (2, 1), bins = 60)
myhist[0, 0].set_xlim((0, 800000))
myhist[1, 0].set_xlim((10, 14))
plt.show()


# In[9]:

mydata[['OverallQual', 'logSalePrice']].boxplot(by = 'OverallQual')
mydata[['Neighborhood', 'logSalePrice']].boxplot(by = 'Neighborhood', rot = 90)
plt.show()

