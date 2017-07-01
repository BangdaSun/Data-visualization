from mpl_toolkits.mplot3d import Axes3D
import matplotlib.pyplot as plt
import numpy as np

"""
    We need to create a figure and add desired axes to it.
    We specify 3D projection for the figure, and the axes we add are Axex3D
"""
### 3D scatter plot
x = range(1, 11)
y = [7, 3, 2, 3, 13, 1, 1, 5, 4, 8]
z = [4, 2, 8, 3, 6, 4, 9, 11, 9, 10]

fig = plt.figure()
ax = fig.add_subplot(111, projection = '3d')
ax.scatter(x, y, z, c = 'r', marker = 'o')
ax.set_xlabel('X label')
ax.set_ylabel('Y label')
ax.set_zlabel('Z label')
ax.view_init(30, 30)
plt.show()
