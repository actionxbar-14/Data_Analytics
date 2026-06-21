                       
                                         #    Chapter_03 : Indexing & Sicing



# :: Accessing of array indexing : 
# - Numpy uses the zero based indexing . 

# - Syntax :  array[index]          --> 1D array 

# - Syntax :  array[row , column]   --> 2D array



# - Ex : 


# import numpy as np 

# arr = np.array([10 , 20 , 30 , 40 , 50])

# print(arr[0])  # output :  10
# print(arr[1])  # output :  20
# print(arr[-1]) # output :  30




# _________________________________________________________________________________________________________________________________________


# :: Slicing:

# - Extracting a subset of an array. 
# - Ex : 

"""

- Syntax : array[start : stop : step]


"""

# import numpy as np

# arr = np.array([10 , 20 ,30 ,40 , 50, 60])

# print(arr[1:5]) # output : [20 30 40 50]

# print(arr[:4])  # output : [10 20 30 40]

# print(arr[::2])  # output : [10 30 50]

# print(arr[::-1])  # output : [60 50 40 30 20 10]





# _________________________________________________________________________________________________________________________________________

# :: fancy indexing : 
# - selecting multiple elements at once. 
# - It is used for non-sequential data. 

# - Ex : 

# import numpy as np

# arr = np.array([10 , 20 ,30 ,40 , 50, 60])


# print(arr[[0 , 2 , 4]])  #--> ye 0th , 2nd , 4th index ke element ko print krega. 



# _________________________________________________________________________________________________________________________________________




# :: Filtering data [ Boolean masking ] : 
# - It gives the specific elements based on the given condition. 

# - Ex : 



# import numpy as np

# arr = np.array([10 , 20 ,30 ,40 , 50, 60])


# print(arr[arr > 25])  # output : [30 40 50 60]



# NOTE : Boolean masking is 10x faster than loop for the filtering of data.



# _________________________________________________________________________________________________________________________________________



