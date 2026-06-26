                                               
                                             #   Chapter : 2 Numpy Basics
 


# :: Checking the shape of array : 
# - shape reperesents the tuple of rows and columns. 

# - Ex : 

# import numpy as np 

# arr_2d = np.array([[1,2,3] , [4,5,6]])

# print(arr_2d.shape)  # output : (2, 3)







# :: Checking the size of array : 
# - total number of elements in array is equal to the size of array. 

# - Ex : 

# import numpy as np 

# arr = np.array([ [10 , 20 , 30] , [40  , 50  , 60] ])

# print(arr.size) # output : 6






# :: Checking the dimension of the array : 
# - using the np.ndim method.  

# - Ex : 

# import numpy as np 

# arr_1d = np.array([1,2,3])
# arr_2d = np.array([ [1,2,3] , [4,5,6] ])
# arr_3d = np.array([[ [1,2,3] , [4,5,6] , [7,8,9] ]])

# print(arr_1d.ndim) # output : 1
# print(arr_2d.ndim) # output : 2
# print(arr_3d.ndim) # output : 3














# :: Checking the type of data : 
# - using the np.dtype method. 

# - Ex : 

# import numpy as np 

# arr = np.array([10 , 20 ,30.5 , 40])

# print(arr.dtype) # Output : float64










# :: Converting the type of data present in the array : 
# - Syntax:  array.astype( newtype )

# - Ex : 




# import numpy as np 


# arr  = np.array([1.2 , 2.5 , 3.8])

# int_arr = arr.astype(int)

# print(int_arr)   # output : [1 2 3]
# print(int_arr.dtype) # output : int64
 












# _______________________________________________________________________________________________________________________________________

# :: Performing the mathmatical operation on array : 



# - Ex:  

# import numpy as np 

# arr = np.array([10 , 20 ,30])

# print(arr + 5)  # output : [15 25 35]
# print(arr * 2)  # output : [20 40 60]
# print(arr - 2)  # output : [ 8 18 28]
# print(arr / 5)  # output : [2. 4. 6.]






# _______________________________________________________________________________________________________________________________________


# :: Performing aggeration function : 


# - Ex : 

# import numpy as np 

# arr = np.array([10 ,20 , 30 , 40 , 50])

# print(np.sum(arr))  # outout : 150 [ gives the sum of the arr values ]
# print(np.mean(arr)) # outout : 30.0 [ gives the mean of the arr values ]
# print(np.min(arr))  # outout : 10 [ gives the minimum of the arr values ]
# print(np.max(arr))  # outout : 50 [ gives the maximum of the arr values ]
# print(np.std(arr))  # outout : 14.142135623730951 [ gives the standard deviation of the arr values ]
# print(np.var(arr))   # outout : 200.0 [ gives the varience of the arr values ]